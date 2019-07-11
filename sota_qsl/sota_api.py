import requests
import json

#https://sota.org.uk/Sota-API/Resources

class SotaApi:
    base_api = "http://api2.sota.org.uk/api/"

    def __init__(self):
        pass

    def retrieve_peak_with_association(self, associationCode, summitCode):
        url = f"{SotaApi.base_api}summits/{associationCode}/{summitCode}"

        response = requests.get(url)
        
        result = SotaPeak(response.text)

        return result

    def retrieve_peak(self, longSummitCode):
        splits = longSummitCode.split('/')
        associationCode = splits[0]
        summitCode = splits[1]

        return self.retrieve_peak_with_association(associationCode, summitCode)


# Sample JSON 2019-07-10
# {'summitCode': 'W7M/GR-086', 'name': 'Medicine Owl Peak', 'shortCode': 'GR-086', 'altM': 2525, 'altFt': 8284, 'gridRef1': '-113.4954', 'gridRef2': '48.6089', 'notes': '', 'validFrom': '0001-01-01T00:00:00', 'validTo': '0001-01-01T00:00:00', 'activationCount': None, 'myActivations': None, 'activationDate': None, 'myChases': None, 'activationCall': None, 'longitude': -113.4954, 'latitude': 48.6089, 'locator': 'DN38go', 'points': 6, 'regionCode': 'GR', 'regionName': 'MT - Glacier Region', 'associationCode': 'W7M', 'associationName': 'USA - Montana'}

class SotaPeak:
    def __init__(self, jsonString):
        self.data = json.loads(jsonString)

    def __getattr__(self, name):
        return self.data[name]

