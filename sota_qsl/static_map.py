import requests

class StaticMapDownloader:
    def __init__(self, key):
        self.key = key

    def retrieve_map(self, latitude, longitude, filename):
        url = "https://maps.googleapis.com/maps/api/staticmap"
        params = {"center": f"{latitude},{longitude}",
                  "zoom": "12",
                  "maptype": "terrain",
                  "size": "640x640",
                  "scale": "2",
                  "markers": f"{latitude},{longitude}",
                  "key": self.key}

        # icon:https%3A%2F%2Fsota.org.uk%2FFrontend%2FImages%2Fsota_logo_30px.jpg|

        response = requests.get(url, params = params)

        if response:
            with open(filename, "wb") as resultFile:
                resultFile.write(response.content)