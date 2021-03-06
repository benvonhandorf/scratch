import jellyfish

class CWGenerator:
    morse_code = {
        "A":".-",
        "B":"-...",
        "C":"-.-.",
        "D":"-..",
        "E":".",
        "F":"..-.",
        "G":"--.",
        "H":"....",
        "I":"..",
        "J":".---",
        "K":"-.-",
        "L":".-..",
        "M":"--",
        "N":"-.",
        "O":"---",
        "P":".--.",
        "Q":"--.-",
        "R":".-.",
        "S":"...",
        "T":"-",
        "U":"..-",
        "V":"...-",
        "W":".--",
        "X":"-..-",
        "Y":"-.--",
        "Z":"--..",
        "0":"-----",
        "1":".----",
        "2":"..---",
        "3":"...--",
        "4":"....-",
        "5":".....",
        "6":"-....",
        "7":"--...",
        "8":"---..",
        "9":"----.",
        "?":"..--..",
        "/":"-..-.",
        ".":".-.-.-",
        ",":"--..--",
        "&":".-...",
        "=":"-...-",
        " ":"_"
        }

    def __init__(self):
        self.distance = {}

        for char in CWGenerator.morse_code:
            char_distance = [[], [], [], [], [], [], [], [], [], []]
            source_morse = CWGenerator.morse_code.get(char)

            for target_char in CWGenerator.morse_code:
                if target_char == " ":
                    continue

                target_morse = CWGenerator.morse_code.get(target_char)

                distance = jellyfish.levenshtein_distance(source_morse, target_morse)

                char_distance[distance].append(target_char)

            self.distance[char] = char_distance

    def generate(s):
        output = ""
        in_prosign = False
        prosign = None

        s = s.upper()

        for char in s:
            if char == "<":
                in_prosign = True
                prosign = ""
                continue

            if in_prosign:
                if char == ">":
                    if len(output) > 0:
                        output += " "

                    for prosign_char in prosign:
                        morse_char = CWGenerator.morse_char.get(prosign_char)
                        output += morse_char
                    in_prosign = False
                    prosign = None
                else:
                    prosign += char

                continue

            if len(output) > 0:
                output += " "

            morse_char = CWGenerator.morse_code.get(char)
            if morse_char is None:
                print(f"No morse found for {char}")
                continue

            output += morse_char

        return output