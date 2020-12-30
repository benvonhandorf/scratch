#!/usr/local/bin/python3

from datetime import datetime
from influxdb import InfluxDBClient
import os
from radio_utils import FrequencyUtils

influxHost = os.environ['INFLUX_HOST']
influxUser = os.environ['INFLUX_USER']
influxPassword = os.environ['INFLUX_PASSWORD']

userCallsign = 'KN4COI'
homeGridSquare = 'EM79'

print("Influx configuration: {} - {}".format(influxHost, influxUser))

with open('~/.local/share/WSJT-X/ALL.TXT', 'r') as logfile:
  raw_logs = logfile.read()
  log_lines = raw_logs.split('\n')

class CacheResponse:
  def __init__(self, cacheData):
    self.text = cacheData

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
            'form_build_id': 'form-eFzYLp8WcZSvZitd_dXfpmjb-atUHieH7kid8v066Sk',
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

    spottime = datetime.strptime(spottime.text.strip(), '%Y-%m-%d %H:%M')

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

print("Importing {} entries".format(len(entries)))

influxClient = InfluxDBClient(influxHost, username=influxUser, password=influxPassword)
influxClient.switch_database('radio')
influxClient.write_points(entries)

