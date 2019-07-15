import requests
import json

class GeocodingApi:
    def __init__(self, key):
        self.key = key

    def reverse_geocode(self, latitude, longitude):
        url = "https://maps.googleapis.com/maps/api/geocode/json"
        params = {"latlng": f"{latitude},{longitude}",
                  "key": self.key}

        response = requests.get(url, params)

        if response:
            return json.loads(response.text)
        else:
            print(f"Error reverse geocoding: {response}")
            return None

