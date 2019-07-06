import boto3

class PollyApi:
    def __init__(self, aws_access_key_id, aws_secret_access_key):
        self.polly_client = boto3.Session(aws_access_key_id = aws_access_key_id,
                                aws_secret_access_key = aws_secret_access_key,
                                region_name='us-west-2').client('polly')

    def synthesize_morse_code(self, morse_code_text, filename):

        ssml = morse_code_text

        if morse_code_text.upper() == morse_code_text:
            ssml = f'<say-as interpret-as="characters">{morse_code_text}</say-as>'

        ssml = f'<speak>{ssml}</speak>'

        response = self.polly_client.synthesize_speech(VoiceId="Joanna",
                                    OutputFormat="mp3",
                                    TextType="ssml",
                                    Text=ssml)

        if response:
            with open(filename, "wb") as resultFile:
                resultFile.write(response['AudioStream'].read())
