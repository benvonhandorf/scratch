from pydub import AudioSegment
from pydub.generators import Sine

class CWSynthesizer:
    def __init__(self, char_speed_wpm, inter_character_wpm, inter_word_wpm):
        self.generator = Sine(700)

        self.dit_length = int(1200/char_speed_wpm)
        self.dah_length = self.dit_length * 3
        self.character_gap = int(1200/inter_character_wpm) * 3
        self.word_gap = int(1200/inter_word_wpm) * 7

        print(f"{self.dit_length} {self.dah_length} {self.character_gap} {self.word_gap}")

    def synthesize(self, morse_code):
        audio = AudioSegment.silent(duration=0)
        in_character = False

        for char in morse_code:
            char_fn = CWSynthesizer.synth.get(char)

            if char_fn is not None:
                (new_audio, new_in_character) = char_fn(self)

                if in_character and new_in_character:
                    #We're within a single character.  We need to provide the gap
                    audio = audio + self.atom_gap()

                in_character = new_in_character

                audio = audio + new_audio
            else:
                print(f"Skipping unknown morse character {char}")

        return audio

    def tone(self, duration):
        result = self.generator.to_audio_segment(duration=duration)
        result = result.fade_in(7).fade_out(7)

        return [result, True]

    def dit(self):
        return self.tone(self.dit_length)

    def dah(self):
        return self.tone(self.dah_length)

    def atom_gap(self):
        return AudioSegment.silent(duration=self.dit_length)

    def inter_character(self):
        return [AudioSegment.silent(duration=self.character_gap), False]

    def inter_word(self):
        return [AudioSegment.silent(duration=self.word_gap), False]

    synth = {
            ".": dit,
            "-": dah,
            " ": inter_character,
            "_": inter_word
        }