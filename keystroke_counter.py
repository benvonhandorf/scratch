import select
import sys
import datetime
import os
import argparse
from influxdb import InfluxDBClient

argument_parser = argparse.ArgumentParser()
argument_parser.add_argument('--influx_server', default=os.environ['INFLUX_HOST'],
    help="Influx DB Host")
argument_parser.add_argument('--influx_user', default=os.environ['INFLUX_USER'],
    help="Influx DB Username")
argument_parser.add_argument('--influx_password', default=os.environ['INFLUX_PASSWORD'],
    help="Influx DB Password")
argument_parser.add_argument('--influx_db', default="sensor",
    help="Influx DB")
argument_parser.add_argument('--type', 
		help="Metric type to record")
argument_parser.add_argument('--source',
		help="Metric source to record")

args = argument_parser.parse_args()


influx_host = args.influx_server
influx_user = args.influx_user
influx_password = args.influx_password

metric_type = args.type
metric_source = args.source

influx_client = InfluxDBClient(host=influx_host, username=influx_user, password=influx_password)
influx_client.switch_database(args.influx_db)

def store_reading(timestamp, value):
	global influx_client

	if value ==0:
		return

	entry = {}

	entry['measurement'] = 'metric'
	entry['time'] = timestamp.isoformat() + 'Z'
	entry['tags'] = {'type': metric_type,
									'source': metric_source									}
	entry['fields'] = {
									'value': value
									}


	entries = [entry]

	influx_client.write_points(entries)

	print(f'Recorded {value}')
	sys.stdout.flush()

def main_loop():
	timestamp = datetime.datetime.utcnow()
	lines = 0

	print('Waiting for input')

	while True:
		ready = select.select([sys.stdin], [], [], 1)[0]

		if ready:
			input = sys.stdin.readline()

			if len(input.rstrip()):
				lines = lines + 1

		if (datetime.datetime.utcnow() - timestamp).seconds > 10:
			print(f'{lines} found')

			store_reading(timestamp, lines)

			timestamp = datetime.datetime.utcnow()

			lines = 0

try:
	main_loop()
except KeyboardInterrupt:
	pass
