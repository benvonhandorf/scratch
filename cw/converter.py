#!/usr/local/bin/python3
import argparse
import fileinput
from cw_generator import CWGenerator
from cw_synthesizer import CWSynthesizer
from koch_generator import KochGenerator
import os
from polly_api import PollyApi
from pydub import AudioSegment

def sample_for_character(character, cw_synthesizer, polly_api, gap_audio):
    cw_text = CWGenerator.generate(character)

    if polly_api is not None:
        filename = polly_api.synthesize_morse_code(character)
                
        tts_audio = AudioSegment.from_mp3(filename)

        return cw_synthesizer.synthesize(cw_text) + gap_audio + tts_audio + gap_audio
    else:
        return cw_synthesizer.synthesize(cw_text)

def process_lines(lines, cw_synthesizer, polly_api, full_audio, switch_to_tts_gap):
    x = 0

    for input_line in lines:
        input_line = input_line.strip()

        if x > 0:
            full_audio = full_audio + cw_synthesizer.synthesize("_")

        cw_text = CWGenerator.generate(input_line)

        cw_audio = cw_synthesizer.synthesize(cw_text)

        full_audio = full_audio + cw_audio + switch_to_tts_gap

        if polly_api is not None:
            filename = polly_api.synthesize_morse_code(input_line)
            
            tts_audio = AudioSegment.from_mp3(filename)

            full_audio = full_audio + tts_audio + switch_to_tts_gap

        x = x + 1

    return full_audio

if __name__ == "__main__":

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--aws_polly_key_id', default=os.environ['AWS_POLLY_KEY_ID'],
        help="AWS Key ID, can also be provided via environment variable AWS_POLLY_KEY_ID")
    argument_parser.add_argument('--aws_secret_access_key', default=os.environ['AWS_SECRET_ACCESS_KEY'],
        help="AWS Secret Access Key, can also be provided via environment variable AWS_SECRET_ACCESS_KEY")
    argument_parser.add_argument('--koch', default=-1, type=int, help='Koch system lesson to use for random text generation')
    argument_parser.add_argument('--group_size', default=5, type=int, help='Number of characters per group')
    argument_parser.add_argument('--group_count', default=20, type=int, help='Number of character groups')
    argument_parser.add_argument('--tts_delay', default=200, type=int, help='Milliseconds to delay text to speech')
    argument_parser.add_argument('--letters', type=str, help='Only specific letters')
    argument_parser.add_argument('--output', default="morse_audio.mp3", type=str, help='Output file name')
    argument_parser.add_argument('--no_tts', dest="tts", action='store_false', help='Disable TTS')
    argument_parser.add_argument('files', metavar='FILES', nargs='*', help='Files to convert, stdin if none')
    argument_parser.set_defaults(tts=True)

    args = argument_parser.parse_args()

    if args.aws_polly_key_id is None or args.aws_secret_access_key or args.tts == False:
        print("TTS Disabled")

        polly_api = None
    else:
        aws_polly_key_id = args.aws_polly_key_id
        aws_secret_access_key = args.aws_secret_access_key

        polly_api = PollyApi(aws_polly_key_id, aws_secret_access_key)

    cw_synthesizer = CWSynthesizer(20, 5, 5)

    full_audio = AudioSegment.silent(duration=2000)
    switch_to_tts_gap = AudioSegment.silent(duration=args.tts_delay)

    if args.koch != -1 or args.letters is not None:
        koch_generator = KochGenerator()

        if args.koch != -1:
            print(f"Koch generation\nLesson {args.koch}\n{args.group_count} groups of {args.group_size} characters")

            character_set = koch_generator.koch_character_set(args.koch)

            text = koch_generator.generate(args.koch, args.group_size, args.group_count)
        else:
            character_set = [char for char in args.letters]

            print(f"Fixed set generation\nCharacters: {character_set}\n{args.group_count} groups of {args.group_size} characters")

            text = koch_generator.generate_for_characters(character_set, args.group_size, args.group_count)
        
        lines = text.replace(" ", "_").split("\n")

        if args.group_size == 1:
            #Special case for single character groups.  Small enough set that we can get a map of each of the samples

            samples_for_character = { c : sample_for_character(c, cw_synthesizer, polly_api, switch_to_tts_gap) for c in character_set }

            x = 0

            for input_line in lines:
                input_line = input_line.strip()

                if x > 0:
                    full_audio = full_audio + cw_synthesizer.inter_word_sample[0]

                audio = samples_for_character[input_line]

                full_audio = full_audio + audio
                x = x + 1

        else:
            full_audio = process_lines(lines, cw_synthesizer, polly_api, full_audio, switch_to_tts_gap)
    else:
        lines = [input_line for input_line in fileinput.input(files=args.files if len(args.files) > 0 else ('-', ))]

        full_audio = process_lines(lines, cw_synthesizer, polly_api, full_audio, switch_to_tts_gap)

    print(f"Exporting {args.output}")
    full_audio.export(args.output, format="mp3")



