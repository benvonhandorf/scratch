import math

class FrequencyUtils:
	def band_for_frequency(frequency, include_suffix=True):
	  frequency_floor = math.floor(frequency)

	  bands = {
	  	1: "160",
	  	3: "80",
	  	5: "60",
	    7: "40",
	    10: "30",
	    14: "20",
	    18: "17",
	    21: "15",
	    24: "12",
	    28: "10",
	    50: "6"
	  }

	  if frequency_floor in bands:
	  	band = bands[frequency_floor]
	  else:
	  	band = frequency_floor
	  	print(f"Unknown band: {frequency_floor} - {frequency}")

	  if include_suffix:
	  	band += "m"

	  return band