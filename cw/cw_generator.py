

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
        " ":"_"
        }

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
                continue

            output += morse_char

        return output