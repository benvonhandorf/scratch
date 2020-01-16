#!/usr/local/bin/python3

import requests
from bs4 import BeautifulSoup
from datetime import datetime
from influxdb import InfluxDBClient
import os
from radio_utils import FrequencyUtils
import argparse

# mqttHost = os.environ['MQTT_HOST']
# mqttUser = os.environ['MQTT_USER']
# mqttPassword = os.environ['MQTT_PASSWORD']

class CacheResponse:
    def __init__(self, cacheData):
        self.text = cacheData


if __name__ == "__main__":

    influxHost = os.environ['INFLUX_HOST']
    influxUser = os.environ['INFLUX_USER']
    influxPassword = os.environ['INFLUX_PASSWORD']

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--call', default="KN4COI",
        help="Call to import")
    argument_parser.add_argument('--antenna', default="20m dipole",
        help="Call to import")

    args = argument_parser.parse_args()

    antenna = args.antenna
    targetCallSign = args.call

    print(f"Querying {targetCallSign} using antenna {antenna}")

    print("Influx configuration: {} - {}".format(influxHost, influxUser))

    cacheData = None

    try:
        cacheFile = open("query_cache.html", "r")

        cacheData = cacheFile.read()
    except FileNotFoundError:
        pass

    if cacheData is None or len(cacheData) == 0:
        print("Retrieving data")

        formData = {'band' : 'All',
                  'count' : '1000',
                  'call' : targetCallSign,
                  'reporter': targetCallSign,
                  'timelimit' : '86400',
                  'sortby' : 'date',
                  'sortrev' : '1',
                  'excludespecial' : '1',
                  'op' : 'Update',
                  'form_build_id': 'form-qVr_oSdFsHMRjYQJm5Pv1rQFmgPMbiSlWsxpCwJ8qFM',
                  'form_id' : 'wsprnet_spotquery_form'}

        response = requests.post('http://wsprnet.org/drupal/wsprnet/spotquery', data=formData)

        with open("{}.log".format(datetime.now().isoformat()), "w") as resultFile:
            resultFile.write(response.text)
    else:
        response = CacheResponse(cacheData)

    soup = BeautifulSoup(response.text, 'html.parser')

    table = soup.find('table')

    rows = table.find_all('tr')

    entries = []

    for row in rows:
        dataItems = row.find_all('td')

        if len(dataItems) == 11:
            # Appears to be a valid data row
            spottimeraw, callsign, frequency, snr, drift, grid, power, spotter, spotgrid, distance, azimuth = dataItems

            spottime = datetime.strptime(spottimeraw.text.strip(), '%Y-%m-%d %H:%M')

            entry = {}
            entry['measurement'] = 'spot'
            entry['time'] = spottime.isoformat() + 'Z'
            entry['tags'] = {'callsign': callsign.text.strip(),
                            'spotter': spotter.text.strip(),
                            'frequency': float(frequency.text.strip()),
                            'band': FrequencyUtils.band_for_frequency(float(frequency.text.strip()), False),
                            'antenna': antenna,
                            'type': 'wspr'
                            }
            entry['fields'] = {
                            'power': float(power.text.strip()),
                            'snr': float(snr.text.strip()),
                            'drift': float(snr.text.strip()),
                            'grid': grid.text.strip(),
                            'spotgrid': spotgrid.text.strip(),
                            'distance': float(distance.text.strip()),
                            'value': float(distance.text.strip()),
                            'azimuth': float(azimuth.text.strip())}

            entries.append(entry)
        else:
            print(f"Unexpected data - {row}")

    print("Importing {} entries".format(len(entries)))

    influxClient = InfluxDBClient(influxHost, username=influxUser, password=influxPassword)
    influxClient.switch_database('radio')
    influxClient.write_points(entries)

