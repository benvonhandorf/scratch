# import PyOpenAL (will require an OpenAL shared library)
from openal import * 

# import the time module, for sleeping during playback
import time

# open our wave file
source = oalOpen("polly_cache_amy/-5555992019005730697.wav")

source2 = oalOpen("polly_cache_amy/6152876365256776127.wav")

source.set_position((1,0,0))

source2.set_position((-1,0,0))

source2.play()

time.sleep(1)

source.play()

# check if the file is still playing
while source.get_state() == AL_PLAYING or source2.get_state() == AL_PLAYING:
	# wait until the file is done playing
	time.sleep(1)
	
# release resources (don't forget this)
oalQuit()