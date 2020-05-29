#!/usr/local/bin/python3

from influxdb import InfluxDBClient

client = InfluxDBClient("littlerascal.local", 8086, "littlerascalnodered", "8g2k5OZ0SXzw", "sensor")

results = client.query("SELECT * FROM readings")

print(results.items().length())
