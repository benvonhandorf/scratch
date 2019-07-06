from pydub import AudioSegment
from pydub.generators import Sine

class CWSynthesizer:
    def __init__(self, char_speed_wpm, char_gap_wpm, word_speed_wpm):
        self.generator = Sine(700)

        self.dit_length = int(1200/char_speed_wpm)
        self.dah_length = self.dit_length * 3
        self.character_gap = int(1200/char_gap_wpm) * 3
        self.word_gap = int(1200/word_speed_wpm)

    def synthesize(self, morse_code):
        audio = AudioSegment.silent(duration=0)

        for char in morse_code:
            char_fn = CWSynthesizer.synth.get(char)

            if char_fn is not None:
                new_audio = char_fn(self)

                audio = audio + new_audio
            else:
                print(f"Skipping unknown morse character {char}")

        return audio

    def tone(self, duration):
        result = self.generator.to_audio_segment(duration=self.dit_length)
        result = result.fade_in(7).fade_out(7)

        return result

    def dit(self):
        return self.tone(self.dit_length)

    def dah(self):
        return self.tone(self.dah_length)

    def character(self):
        return AudioSegment.silent(duration=self.character_gap)

    def word(self):
        return AudioSegment.silent(duration=self.word_gap)

    synth = {
            ".": dit,
            "-": dah,
            " ": character,
            "_": word
        }