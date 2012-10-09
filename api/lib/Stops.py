import requests
from api.settings import SERVICE_BASE_URL, WEB_SERVICES

class Stops:
    def __init__(self):
        pass

    def by_lat_long(self, lat, long):
        query_string = [
            SERVICE_BASE_URL,
            WEB_SERVICES,
            '?func=stops_nearby',
            '&lat=',
            lat,
            '&lng=',
            long
        ]

        r = requests.get("".join(query_string))
        return r.json

    def by_stop_code(self, stop_code):
        query_string = [
            SERVICE_BASE_URL,
            WEB_SERVICES,
            '?func=stop_info',
            '&stop_code=',
            stop_code
        ]

        r = requests.get("".join(query_string))
        return r.json