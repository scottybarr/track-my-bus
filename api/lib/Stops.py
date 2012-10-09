import requests
from api.settings import BUS_TRACKER_BASE_URL

class Stops:
    def __init__(self):
        pass

    def search_by_lat_long(self, lat, long):
        query_string = [
            BUS_TRACKER_BASE_URL,
            '?func=stops_nearby',
            '&lat=',
            lat,
            '&lng=',
            long
        ]

        r = requests.get("".join(query_string))
        return r.json

    def search_by_stop_code(self, stop_code):
        query_string = [
            BUS_TRACKER_BASE_URL,
            '?func=stop_info',
            '&stop_code=',
            stop_code
        ]

        r = requests.get("".join(query_string))
        return r.json