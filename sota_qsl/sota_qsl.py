#!/usr/local/bin/python3

import argparse
import os
import requests
from datetime import datetime
from sota_api import SotaApi
import sota_api
from static_map import StaticMapDownloader
import svgwrite
from pathlib import Path

from svglib.svglib import svg2rlg
from reportlab.graphics import renderPDF, renderPM

import json

full_size = ("8.5in","11in")
card_size = ("4.25in", "5.5in")
min_insets = ("0.25in", "0.25in")

def populate_card(dwg, card, peak, static_maps):
    

    rect = card.add(dwg.rect(size=card_size))
    rect.fill("none")
    rect.stroke("black")

    activationMarker = "*" if peak.activationCount is None else activationCount

    card.add(dwg.text(peak.name, insert=min_insets))
    card.add(dwg.text(f"SOTA: {peak.summitCode}  @  {peak.points}pts{activationMarker}", insert=(min_insets[0], "0.5in")))
    card.add(dwg.text(f"POTA:", insert=("2.5in", "0.5in")))
    card.add(dwg.text(f"Ele: {peak.altM}m/{peak.altFt}'", insert=(".25in", "0.75in")))
    card.add(dwg.text(f"Loc: {peak.locator}   {peak.latitude}, {peak.longitude}", insert=(".25in", "1in")))
    card.add(dwg.text(f"Date (UTC):", insert=(".25in", "1.25in")))
    card.add(dwg.text(f"WX:", insert=(".25in", "1.5in")))
    card.add(dwg.text(f"Notes:", insert=(".25in", "2in")))

    static_map_filename = Path(peak.summitCode.replace("/", "-") + ".png")
    # static_map_filename = Path("test.png")

    if not static_map_filename.is_file():
        print(f"Retrieving static map for {peak.summitCode}: {peak.latitude}, {peak.longitude}")
        static_maps.retrieve_map(peak.latitude, peak.longitude, static_map_filename)

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

    argument_parser.set_defaults(tts=True)

    args = argument_parser.parse_args()


    activator = args.activator
    # static_maps_api_key = os.environ['STATIC_MAPS_API_KEY']
    # sota_login = os.environ['SOTA_LOGIN']
    # sota_key = os.environ['SOTA_KEY']

    sota_peaks = [ item.strip() for item in args.peaks.split(",") ]

    print(sota_peaks)

    # sota_api = SotaApi()

    # peaks = [ sota_api.retrieve_peak(sota_peak) for sota_peak in sota_peaks ]

    peaks = []

    for peak_code in sota_peaks:
        filename = peak_code.replace("/", "-") + ".json"
        with open(filename, "r") as file:
            text = file.read()
            peak = sota_api.SotaPeak(text)
            peaks.append(peak)

    static_maps = StaticMapDownloader(args.static_maps_key)

    dwg = svgwrite.Drawing("reference_card.svg", size=full_size)
    bg = dwg.add(dwg.rect(size=full_size))
    bg.fill("none")
    bg.stroke("black")

    card = dwg.svg(size=card_size)
    populate_card(dwg, card, peaks[0], static_maps)
    dwg.add(card)

    if len(peaks) > 1:
        card = dwg.svg(insert=(card_size[0], 0),size=card_size)
        populate_card(dwg, card, peaks[1], static_maps)
        dwg.add(card)

    if len(peaks) > 2:
        card = dwg.svg(insert=(0, card_size[1]),size=card_size)
        populate_card(dwg, card, peaks[2], static_maps)
        dwg.add(card)

    if len(peaks) > 3:
        card = dwg.svg(insert=(card_size[0], card_size[1]),size=card_size)
        populate_card(dwg, card, peaks[3], static_maps)
        dwg.add(card)

    dwg.save()

    saved_svg = svg2rlg("file.svg")
    renderPDF.drawToFile(saved_svg, "reference_card.pdf")


# latitude = 48.6319
# longitude = -113.4894

# static_maps.retrieve_map(latitude, longitude, "test.png")