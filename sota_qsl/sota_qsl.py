#!/usr/local/bin/python3

import os
import requests
from datetime import datetime
from ../radio_utils import FrequencyUtils
from sota_api import SotaApi

activator = "KN4COI"
static_maps_api_key = os.environ['STATIC_MAPS_API_KEY']
sota_login = os.environ['SOTA_LOGIN']
sota_key = os.environ['SOTA_KEY']
sota_peak = "W0C/FR-003"

sota_api = SotaApi(sota_login, sota_key)