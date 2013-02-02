import requests
from config import SERVICE_BASE_URL, WEB_SERVICES, BUS_TRACKER
import simplejson


class BusStops:
    def __init__(self):
        pass

    def by_lat_long(self, lat, long):
        query_string = [
            SERVICE_BASE_URL,
            WEB_SERVICES,
            '?func=stops_nearby',
            '&lat=',
            str(lat),
            '&lng=',
            str(long)
        ]
        r = requests.get("".join(query_string))
        return simplejson.loads(r.text)

    def by_stop_code(self, stop_code):
        query_string = [
            SERVICE_BASE_URL,
            BUS_TRACKER,
            '?stop_code=',
            str(stop_code)
        ]
        r = requests.get("".join(query_string))
        return simplejson.loads(r.text)