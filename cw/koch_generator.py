import random

class KochGenerator:
	lesson_characters = [
		"K", "M", "U", "R", "E", "S", "N", "A", "P", "T",
		"L", "W", "I", ".", "J", "Z", "=", "F", "O", "Y", ",",
		"V", "G", "5", "/", "Q", "9", "2", "H", "3", "8",
		"B", "?", "4", "7", "C", "1", "D", "6", "0", "X" ]

	def __init__(self):
		self.random = random.Random()


	def generate(self, lesson_number, group_size, group_count):
		characters = KochGenerator.lesson_characters[:lesson_number + 1]

		output = ""

		for x in range(group_count):
			if len(output) > 0:
				output = output + "\n"

			for y in range(group_size):
				char_index = self.random.randint(0, len(characters) - 1)
				output = output + characters[char_index]

		return output

