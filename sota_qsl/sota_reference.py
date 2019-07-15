#!/usr/local/bin/python3

import argparse
import os
import requests
from datetime import datetime
from sota_api import SotaApi
import sota_api
from static_map import StaticMapDownloader
from geocoding_api import GeocodingApi
import svgwrite
from pathlib import Path
import sys

import json

full_size = ("8.5in","11in")
card_size = ("4.25in", "5.5in")
min_insets = ("0.25in", "0.3in")

def build_location_description(geo_data):
    try:
        address_result = geo_data["results"][0]

        county = ""
        state = ""
        country = ""

        for component in address_result["address_components"]:
            if component["types"][0] == "administrative_area_level_2":
                county = component["short_name"]
                continue
            if component["types"][0] == "administrative_area_level_1":
                state = component["short_name"]
                continue
            if component["types"][0] == "country":
                country = component["short_name"]
                continue

        return f"{county}, {state}, {country}"
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise
        return ""

def populate_card(dwg, card, peak, loc_id, static_maps, geocoding_api):

    geo_data = geocoding_api.reverse_geocode(peak.latitude, peak.longitude)
    location_description = build_location_description(geo_data)
    print(f"Location description: {location_description}")

    rect = card.add(dwg.rect(size=card_size))
    rect.fill("none")
    rect.stroke("black")

    activationMarker = "*" if peak.activationCount is None else activationCount

    card.add(dwg.text(peak.name, insert=min_insets))
    card.add(dwg.text(f"SOTA: {peak.summitCode}  @  {peak.points}pts{activationMarker} {loc_id}", insert=(min_insets[0], "0.5in")))
    card.add(dwg.text(f"Ele: {peak.altM}m/{peak.altFt}'", insert=(".25in", "0.75in")))
    card.add(dwg.text(f"Loc: {peak.locator}   {peak.latitude}, {peak.longitude}", insert=(".25in", "1in")))
    card.add(dwg.text(f"{location_description}", insert=(".5in", "1.25in")))
    card.add(dwg.text(f"Date (UTC):", insert=(".25in", "1.5in")))
    card.add(dwg.text(f"WX:", insert=(".25in", "1.75in")))
    card.add(dwg.text(f"Notes:", insert=(".25in", "2.25in")))

    static_map_filename = Path(peak.summitCode.replace("/", "-") + ".png")
    # static_map_filename = Path("test.png")

    if not static_map_filename.is_file():
        print(f"Retrieving static map for {peak.summitCode}: {peak.latitude}, {peak.longitude}")
        static_maps.retrieve_map(peak.latitude, peak.longitude, static_map_filename, zoom=13)

    map_image = card.add(dwg.image(href=static_map_filename.resolve().as_uri(), size=("3.75in", "2in"), insert=("0.25in", "3.5in")))
    map_image.fit()

if __name__ == "__main__":

    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('--activator', default="KN4COI",
        help="Call of the activator")
    argument_parser.add_argument('--peaks', default="W7M/GR-086,W7M/GR-130,W7M/GR-032,W7M/GR-049",
        help="Comma separated list of peaks")
    argument_parser.add_argument('--static_maps_key', 
        help="Google Maps Static Map API key to use for map generation")
    argument_parser.add_argument('--loc_id', default = "",
        help="Additional location identifiers - Applied to all cards")

    argument_parser.set_defaults(tts=True)

    args = argument_parser.parse_args()


    activator = args.activator
    # static_maps_api_key = os.environ['STATIC_MAPS_API_KEY']
    # sota_login = os.environ['SOTA_LOGIN']
    # sota_key = os.environ['SOTA_KEY']

    sota_peaks = [ item.strip() for item in args.peaks.split(",") ]

    print(sota_peaks)

    sota_api_impl = SotaApi()

    peaks = []

    for peak_code in sota_peaks:
        filename = peak_code.replace("/", "-") + ".json"
        file_path = Path(filename)

        if file_path.is_file():
            with open(filename, "r") as file:
                text = file.read()
                peak = sota_api.SotaPeak(text)
                peaks.append(peak)
        else:
            peak = sota_api_impl.retrieve_peak(peak_code)

            if peak is not None:
                with open(filename, "w") as file:
                    file.write(json.dumps(peak.data))

                peaks.append(peak)

    static_maps = StaticMapDownloader(args.static_maps_key)

    geocoding_api = GeocodingApi(args.static_maps_key)

    dwg = svgwrite.Drawing("reference_card.svg", size=full_size)
    bg = dwg.add(dwg.rect(size=full_size))
    bg.fill("none")
    bg.stroke("none")

    card = dwg.svg(insert=(0, 0), size=card_size)
    populate_card(dwg, card, peaks[0], args.loc_id, static_maps, geocoding_api)
    dwg.add(card)

    if len(peaks) > 1:
        card = dwg.svg(insert=(card_size[0], 0),size=card_size)
        populate_card(dwg, card, peaks[1], args.loc_id, static_maps, geocoding_api)
        dwg.add(card)

    if len(peaks) > 2:
        card = dwg.svg(insert=(0, card_size[1]),size=card_size)
        populate_card(dwg, card, peaks[2], args.loc_id, static_maps, geocoding_api)
        dwg.add(card)

    if len(peaks) > 3:
        card = dwg.svg(insert=(card_size[0], card_size[1]),size=card_size)
        populate_card(dwg, card, peaks[3], args.loc_id, static_maps, geocoding_api)
        dwg.add(card)

    dwg.save()


# latitude = 48.6319
# longitude = -113.4894

# static_maps.retrieve_map(latitude, longitude, "test.png")