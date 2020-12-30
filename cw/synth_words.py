#!/usr/local/bin/python3
import argparse
from polly_api import PollyApi
from pydub import AudioSegment
from openal import * 
import time
from pydub import AudioSegment
from pathlib import Path
import random

if __name__ == "__main__":

	argument_parser = argparse.ArgumentParser()
	argument_parser.add_argument('--aws_polly_key_id', default=os.environ['AWS_POLLY_KEY_ID'],
		help="AWS Key ID, can also be provided via environment variable AWS_POLLY_KEY_ID")
	argument_parser.add_argument('--aws_secret_access_key', default=os.environ['AWS_SECRET_ACCESS_KEY'],
		help="AWS Secret Access Key, can also be provided via environment variable AWS_SECRET_ACCESS_KEY")

	argument_parser.add_argument('--file', default='script.txt',
		help="File to use")

	argument_parser.add_argument('--file_repeat', default='script_repeat.txt',
		help="File to use")

	args = argument_parser.parse_args()

	polly_apis = []


	polly_apis.append(PollyApi(args.aws_polly_key_id, args.aws_secret_access_key, "Joanna"))
	# polly_apis.append(PollyApi(args.aws_polly_key_id, args.aws_secret_access_key, "Amy"))
	# polly_apis.append(PollyApi(args.aws_polly_key_id, args.aws_secret_access_key, "Kendra"))
	# polly_apis.append(PollyApi(args.aws_polly_key_id, args.aws_secret_access_key, "Emma"))
	# polly_apis.append(PollyApi(args.aws_polly_key_id, args.aws_secret_access_key, "Kimberly"))


	counter = 0

	word_list = []

	with open(args.file) as input_file:
		word_list = input_file.readlines()

	words = {}

	for word in word_list:
		modified_word = word # f'<amazon:effect name="whispered">{word}</amazon:effect>'

		polly_api = polly_apis[counter % len(polly_apis)]

		input_file = polly_api.synthesize_morse_code(modified_word)

		wav_file = Path(str(input_file).replace('.mp3', '.wav'))

		if not wav_file.is_file():
			sound = AudioSegment.from_mp3(input_file)
			sound.export(wav_file, format="wav")

		words[word] = str(wav_file)

		counter = counter + 1

	word_list_repeat = []

	with open(args.file_repeat) as input_file:
		word_list_repeat = input_file.readlines()

	words_repeat = {}

	for word in word_list_repeat:
		modified_word = word # f'<amazon:effect name="whispered">{word}</amazon:effect>'

		for i in range(1,3):
			polly_api = polly_apis[counter % len(polly_apis)]

			input_file = polly_api.synthesize_morse_code(modified_word)

			wav_file = Path(str(input_file).replace('.mp3', '.wav'))

			if not wav_file.is_file():
				sound = AudioSegment.from_mp3(input_file)
				sound.export(wav_file, format="wav")

			words_repeat[word] = str(wav_file)

			counter = counter + 1

	counter = 0

	for word in words.keys():
		input_file = words[word]

		# open our wave file
		source = oalOpen(input_file)

		if counter % 2 == 0:
			source.set_position((1,0,0))
		else:
			source.set_position((-1,0,0))

		# and start playback
		source.play()

		# check if the file is still playing
		while source.get_state() == AL_PLAYING:
			# wait until the file is done playing
			time.sleep(1)

		counter = counter + 1

		time.sleep(3)

	for i in range(1,50):
		input_file1 = random.choice(list(words_repeat.values()))
		# input_file2 = random.choice(list(words_repeat.values()))

		# open our wave file
		source1 = oalOpen(input_file1)
		# source2 = oalOpen(input_file2)

		source1.set_position((1,0,0))

		# if counter % 2 == 0:
		# 	source1.set_position((1,0,0))
		# 	source2.set_position((-1,0,0))
		# else:
		# 	source1.set_position((-1,0,0))
		# 	source2.set_position((1,0,0))

		# and start playback
		source1.play()
		# time.sleep(random.uniform(0.1, 0.7))
		# source2.play()

		# check if the file is still playing
		while source1.get_state() == AL_PLAYING:
			# or source2.get_state() == AL_PLAYING:
			# wait until the file is done playing
			time.sleep(1)

		counter = counter + 1

		time.sleep(random.uniform(0.1, 1))

		
	# release resources (don't forget this)
	oalQuit()
