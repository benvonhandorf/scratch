#!/usr/local/bin/python3
import argparse
import fileinput
from cw_generator import CWGenerator
from cw_synthesizer import CWSynthesizer
import os
from polly_api import PollyApi
from pydub import AudioSegment

if __name__ == "__main__":

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--aws_polly_key_id', default=os.environ['AWS_POLLY_KEY_ID'],
        help="AWS Key ID, can also be provided via environment variable AWS_POLLY_KEY_ID")
    argument_parser.add_argument('--aws_secret_access_key', default=os.environ['AWS_SECRET_ACCESS_KEY'],
        help="AWS Secret Access Key, can also be provided via environment variable AWS_SECRET_ACCESS_KEY")
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

    for input_line in fileinput.input(files=args.files if len(args.files) > 0 else ('-', )):
        if x > 0:
            print("Line break")
            full_audio = full_audio + cw_synthesizer.synthesize("_")

        cw_text = CWGenerator.generate(input_line)
        print(cw_text)

        cw_audio = cw_synthesizer.synthesize(cw_text)

        full_audio = full_audio + cw_audio + switch_to_tts_gap

        filename = f"{x}.mp3"
        polly_api.synthesize_morse_code(input_line, filename)
        
        tts_audio = AudioSegment.from_mp3(filename)

        full_audio = full_audio + tts_audio + switch_to_tts_gap
        x = x + 1

    if x > 0:
        print("Exporting")
        full_audio.export("morse_audio.mp3", format="mp3")



