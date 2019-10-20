#!/bin/bash

echo "$1"

python3 converter.py --cwops $1 --last 10 --tts_delay 2000 --tts_after --group_size 1 --group_count 300 --output "cwops_$1_letters_recent.mp3"
python3 converter.py --cwops $1 --words 7 --repeat 3 --repeat_delay 1000 --tts_delay 7000 --tts_after --group_count 100 --output "cwops_$1_words_assignment.mp3"
