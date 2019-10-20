import boto3
from pathlib import Path

class PollyApi:
    def __init__(self, aws_access_key_id, aws_secret_access_key):
        self.polly_client = boto3.Session(aws_access_key_id=aws_access_key_id,
                                aws_secret_access_key=aws_secret_access_key,
                                region_name='us-west-2').client('polly')

        self.voice_id = "Joanna"

        self.cache_directory = f"polly_cache_{self.voice_id.lower()}"

        cache_dir_file = Path(self.cache_directory)

        if not cache_dir_file.exists():
            cache_dir_file.mkdir(parents=True)

    def synthesize_morse_code(self, morse_code_text):

        ssml = morse_code_text
        is_characters = False

        if morse_code_text.upper() == morse_code_text:
            is_characters = True

        if is_characters:
            ssml = f'<say-as interpret-as="characters">{morse_code_text}</say-as>'
        else:
            ssml = f'<speak>{ssml}</speak>'

        filename = self.filename_for(morse_code_text, is_characters)

        file_path = Path(self.cache_directory, filename)

        if file_path.is_file():
            #We have this desired text in cache already.  Use it
            return file_path


        response = self.polly_client.synthesize_speech(VoiceId=self.voice_id,
                                    OutputFormat="mp3",
                                    TextType="ssml",
                                    Text=ssml)

        if response:
            with file_path.open(mode="wb") as resultFile:
                resultFile.write(response['AudioStream'].read())

        return file_path

    def filename_for(self, morse_code_text, is_characters):
        filename = morse_code_text.strip().replace(" ", "_").replace("/", "slash")

        if is_characters:
            filename = "characters_" + filename

        return filename + ".mp3"

