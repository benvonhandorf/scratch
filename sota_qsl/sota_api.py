import requests
import json

#https://sota.org.uk/Sota-API/Resources

class SotaApi:
    base_api = "http://api.sota.org.uk/api/"

    def __init__(self, login, key):
        self.login = login
        self.key = key

    def retrieve_peak(self, associationCode, summitCode):
        result = SotaPeak('')
        return result

    def retrieve_peak(self, longSummitCode):
        splits = longSummitCode.split('/')
        associationCode = splits[0]
        summitCode = splits[1]

        return self.retrieve_peak(associationCode, summitCode)

class SotaPeak:
    def __init__(self, jsonString):
        self.data = json.load(jsonString)

