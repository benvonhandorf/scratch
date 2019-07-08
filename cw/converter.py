#!/usr/local/bin/python3
import argparse
import fileinput
from cw_generator import CWGenerator
from cw_synthesizer import CWSynthesizer
from koch_generator import KochGenerator
import os
from polly_api import PollyApi
from pydub import AudioSegment

if __name__ == "__main__":

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--aws_polly_key_id', default=os.environ['AWS_POLLY_KEY_ID'],
        help="AWS Key ID, can also be provided via environment variable AWS_POLLY_KEY_ID")
    argument_parser.add_argument('--aws_secret_access_key', default=os.environ['AWS_SECRET_ACCESS_KEY'],
        help="AWS Secret Access Key, can also be provided via environment variable AWS_SECRET_ACCESS_KEY")
    argument_parser.add_argument('--koch', default=-1, type=int, help='Koch system lesson to use for random text generation')
    argument_parser.add_argument('--koch_group_size', default=5, type=int, help='Number of characters per group')
    argument_parser.add_argument('--koch_group_count', default=20, type=int, help='Number of character groups')
    argument_parser.add_argument('files', metavar='FILES', nargs='*', help='Files to convert, stdin if none')

    args = argument_parser.parse_args()

    aws_polly_key_id = args.aws_polly_key_id
    aws_secret_access_key = args.aws_secret_access_key

    print(f"AWS Credentials: {aws_polly_key_id} {aws_secret_access_key}")

    polly_api = PollyApi(aws_polly_key_id, aws_secret_access_key)

    cw_synthesizer = CWSynthesizer(20, 5, 5)

    x = 0

    full_audio = AudioSegment.silent(duration=2000)
    switch_to_tts_gap = AudioSegment.silent(duration=0)

    if args.koch != -1:
        print(f"Koch generation\nLesson {args.koch}\n{args.koch_group_count} groups of {args.koch_group_size} characters")

        koch_generator = KochGenerator()

        koch_text = koch_generator.generate(args.koch, args.koch_group_size, args.koch_group_count)

        lines = koch_text.replace(" ", "_").split("\n")

        for input_line in lines:
            input_line = input_line.strip()
            if x > 0:
                print("Line break")
                full_audio = full_audio + cw_synthesizer.synthesize("_")

            cw_text = CWGenerator.generate(input_line)
            print(cw_text)

            cw_audio = cw_synthesizer.synthesize(cw_text)

            full_audio = full_audio + cw_audio + switch_to_tts_gap

            filename = polly_api.synthesize_morse_code(input_line)
            
            tts_audio = AudioSegment.from_mp3(filename)

            full_audio = full_audio + tts_audio + switch_to_tts_gap
            x = x + 1
    else:
        for input_line in fileinput.input(files=args.files if len(args.files) > 0 else ('-', )):
            input_line = input_line.strip()
            if x > 0:
                print("Line break")
                full_audio = full_audio + cw_synthesizer.synthesize("_")

            cw_text = CWGenerator.generate(input_line)
            print(cw_text)

            cw_audio = cw_synthesizer.synthesize(cw_text)

            full_audio = full_audio + cw_audio + switch_to_tts_gap

            filename = polly_api.synthesize_morse_code(input_line)
            
            tts_audio = AudioSegment.from_mp3(filename)

            full_audio = full_audio + tts_audio + switch_to_tts_gap
            x = x + 1

    if x > 0:
        print("Exporting")
        full_audio.export("morse_audio.mp3", format="mp3")



