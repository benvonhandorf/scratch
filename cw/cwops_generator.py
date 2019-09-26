class CWOpsGenerator:
	lessons = [
		["T", "E", "A", "N"],
		["O", "I", "S", "1", "4"],
		["R", "H", "D", "L", "2", "5"],
		["U", "C"],
		["M", "W", "3", "6", "?"],
		["F", "Y"],
		["P", "G", "7", "9", "/"],
		["B", "V"],
		["K", "J", "8", "0", "<BT>"], # Pro Signs: <BT>
		["X", "Q", "Z", "<BK>"], # Pro Signs: <BK>
		]

	def generate(self, lesson_number, group_size, group_count):
		characters = self.character_set(lesson_number)

		return self.generate_for_characters(characters, group_size, group_count)

	def character_set(self, lesson_number):
		lessons = CWOpsGenerator.lessons[:lesson_number]
		characters = [character for lesson in lessons for character in lesson ]
		return characters
