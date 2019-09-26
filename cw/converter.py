#!/usr/local/bin/python3
import argparse
import fileinput
from cw_generator import CWGenerator
from cw_synthesizer import CWSynthesizer
from koch_generator import KochGenerator
from cwops_generator import CWOpsGenerator
import os
from polly_api import PollyApi
from pydub import AudioSegment
import re
import random

def sample_for_character(character, cw_synthesizer, polly_api, gap_audio):
    cw_text = CWGenerator.generate(character)

    if polly_api is not None:
        filename = polly_api.synthesize_morse_code(character)
                
        tts_audio = AudioSegment.from_mp3(filename)

        return cw_synthesizer.synthesize(cw_text) + gap_audio + tts_audio + gap_audio
    else:
        return cw_synthesizer.synthesize(cw_text)

def process_lines(lines, cw_synthesizer, polly_api, tts_before, tts_after, full_audio, group_delay, switch_to_tts_gap, repeat, repeat_delay):
    x = 0

    for input_line in lines:
        input_line = input_line.strip()

        if x > 0:
            full_audio = full_audio + group_delay

        cw_text = CWGenerator.generate(input_line)

        cw_audio = cw_synthesizer.synthesize(cw_text)

        tts_audio = None

        if polly_api is not None and tts_before:
            filename = polly_api.synthesize_morse_code(input_line)

            tts_audio = AudioSegment.from_mp3(filename)

            full_audio = full_audio + tts_audio + switch_to_tts_gap

        for rpt in range(0, repeat):
            if rpt > 0:
                full_audio = full_audio + repeat_delay + cw_audio
            else:
                full_audio = full_audio + cw_audio

        if polly_api is not None and tts_after:
            filename = polly_api.synthesize_morse_code(input_line)

            tts_audio = AudioSegment.from_mp3(filename)

            full_audio = full_audio + switch_to_tts_gap + tts_audio

        x = x + 1

    return full_audio

def find_words(words_file, character_set, max_length):
    raw_exp = f"^[{''.join(character_set)}]{{1,{max_length}}}$"
    print(raw_exp)
    exp = re.compile(raw_exp, re.IGNORECASE)

    words = []
    x = 0
    with open(words_file, "r") as dictionary:
        line = dictionary.readline().strip()

        while line:
            x = x + 1

            if exp.match(line):
                words.append(line)

            line = dictionary.readline().strip()

    print(f"Found {len(words)} words matching character set in dictionary of {x} words: {words}")

    return words

def generate_for_characters(characters, group_size, group_count):
    rnd = random.Random()
    output = ""

    for x in range(group_count):
        if len(output) > 0:
            output = output + "\n"

        for y in range(group_size):
            char_index = rnd.randint(0, len(characters) - 1)
            output = output + characters[char_index]

    return output

if __name__ == "__main__":

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--aws_polly_key_id', default=os.environ['AWS_POLLY_KEY_ID'],
        help="AWS Key ID, can also be provided via environment variable AWS_POLLY_KEY_ID")
    argument_parser.add_argument('--aws_secret_access_key', default=os.environ['AWS_SECRET_ACCESS_KEY'],
        help="AWS Secret Access Key, can also be provided via environment variable AWS_SECRET_ACCESS_KEY")
    argument_parser.add_argument('--speed', default=20, type=int, help='WPM speed')
    argument_parser.add_argument('--speed_farnsworth', default=-1, type=int, help='Farnsworth spacing')
    argument_parser.add_argument('--koch', default=-1, type=int, help='Koch system lesson to use for random text generation')
    argument_parser.add_argument('--cwops', default=-1, type=int, help='CWOps lesson to use for random text generation')
    argument_parser.add_argument('--last', default=1000, type=int, help='Only last n eligible characters')
    argument_parser.add_argument('--group_size', default=5, type=int, help='Number of characters per group')
    argument_parser.add_argument('--group_count', default=20, type=int, help='Number of character groups')
    argument_parser.add_argument('--repeat', default=1, type=int, help='Repeat each group N times, including TTS, if enabled')
    argument_parser.add_argument('--repeat_delay', default=500, type=int, help='Delay between repeats')
    argument_parser.add_argument('--tts_delay', default=200, type=int, help='Milliseconds to delay text to speech')
    argument_parser.add_argument('--group_delay', default=200, type=int, help='Milliseconds between groups or lines')
    argument_parser.add_argument('--letters', type=str, help='Only specific letters')
    argument_parser.add_argument('--output', default="morse_audio.mp3", type=str, help='Output file name')
    argument_parser.add_argument('--no_tts', dest="tts", action='store_false', help='Disable TTS')
    argument_parser.add_argument('--tts_before', dest="tts_before", action='store_true', help='TTS before code')
    argument_parser.add_argument('--tts_after', dest="tts_after", action='store_true', help='TTS after code')
    argument_parser.add_argument('--words', dest="words", action='store_true', help='Disable TTS')
    argument_parser.add_argument('--words_file', type=str, default='common_words.txt')
    argument_parser.add_argument('files', metavar='FILES', nargs='*', help='Files to convert, stdin if none')
    argument_parser.set_defaults(tts=True, tts_before=False, tts_after=False, words=False)

    args = argument_parser.parse_args()

    if args.aws_polly_key_id is None or args.aws_secret_access_key is None or args.tts == False:
        print("TTS Disabled")

        polly_api = None
        args.switch_to_tts_gap = 0
    else:
        aws_polly_key_id = args.aws_polly_key_id
        aws_secret_access_key = args.aws_secret_access_key

        polly_api = PollyApi(aws_polly_key_id, aws_secret_access_key)

    if args.speed_farnsworth == -1:
        farnsworth = args.speed
    else:
        farnsworth = args.speed_farnsworth

    cw_synthesizer = CWSynthesizer(args.speed, args.speed, farnsworth)

    full_audio = AudioSegment.silent(duration=2000)
    switch_to_tts_gap = AudioSegment.silent(duration=args.tts_delay)
    group_delay = AudioSegment.silent(duration=args.group_delay)
    repeat_delay = AudioSegment.silent(duration=args.repeat_delay)

    character_set = None

    if args.koch != -1:
        print(f"Koch generation\nLesson {args.koch}")

        koch_generator = KochGenerator()

        character_set = koch_generator.character_set(args.koch)

    if args.cwops != -1:
        print(f"CWOps generation\nLesson {args.cwops}")

        cwops_generator = CWOpsGenerator()

        character_set = cwops_generator = cwops_generator.character_set(args.cwops)

    if args.letters is not None:
        print(f"Fixed set generation")

        character_set = [char for char in args.letters]

    if character_set is not None:
        character_set = character_set[-args.last:]

        print(f"Characters: {character_set}\n{args.group_count} groups of {args.group_size} characters")

        text = ""

        if args.words:
            print(f"Word based")

            word_list = find_words(args.words_file, character_set, args.group_size)

            if len(word_list) == 0:
                print("No words found matching criteria - exiting")
                exit()

            rand = random.Random()
            last_word = -1

            for i in range(0, args.group_count):
                idx = rand.randint(0, len(word_list) - 1)

                while idx == last_word and len(word_list) > 2:
                    idx = rand.randint(0, len(word_list) - 1)

                last_word = idx

                word = word_list[idx]

                text = text + word + "\n"

        else:
            text = generate_for_characters(character_set, args.group_size, args.group_count)
        
        lines = text.replace(" ", "_").split("\n")

        # if args.group_size == 1:
        #     #Special case for single character groups.  Small enough set that we can get a map of each of the samples

        #     samples_for_character = { c : sample_for_character(c, cw_synthesizer, polly_api, switch_to_tts_gap) for c in character_set }

        #     x = 0

        #     for input_line in lines:
        #         input_line = input_line.strip()

        #         for rpt in range(1, args.repeat):
        #             if x > 0:
        #                 full_audio = full_audio + cw_synthesizer.inter_word_sample[0]

        #             audio = samples_for_character[input_line]

        #             full_audio = full_audio + audio
        #             x = x + 1

        # else:
        full_audio = process_lines(lines, cw_synthesizer, polly_api, args.tts_before, args.tts_after, full_audio, group_delay, switch_to_tts_gap, args.repeat, repeat_delay)
    else:
        lines = [input_line for input_line in fileinput.input(files=args.files if len(args.files) > 0 else ('-', ))]

        full_audio = process_lines(lines, cw_synthesizer, polly_api, args.tts_before, args.tts_after, full_audio, group_delay, switch_to_tts_gap, args.repeat, repeat_delay)

    print(f"Exporting {args.output}")
    full_audio.export(args.output, format="mp3")



