class CWOpsGenerator:
	lessons = [
		["T", "E", "A", "N"],
		["O", "I", "S", "1", "4"]
		]

	def generate(self, lesson_number, group_size, group_count):
		characters = self.character_set(lesson_number)

		return self.generate_for_characters(characters, group_size, group_count)

	def character_set(self, lesson_number):
		lessons = CWOpsGenerator.lessons[:lesson_number]
		characters = [character for lesson in lessons for character in lesson ]
		return characters
