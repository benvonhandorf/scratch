class KochGenerator:
	lesson_characters = [
		"K", "M", "U", "R", "E", "S", "N", "A", "P", "T",
		"L", "W", "I", ".", "J", "Z", "=", "F", "O", "Y", ",",
		"V", "G", "5", "/", "Q", "9", "2", "H", "3", "8",
		"B", "?", "4", "7", "C", "1", "D", "6", "0", "X" ]

	def generate(self, lesson_number, group_size, group_count):
		characters = self.koch_character_set(lesson_number)

		return self.generate_for_characters(characters, group_size, group_count)

	def character_set(self, lesson_number):
		return KochGenerator.lesson_characters[:lesson_number + 1]
