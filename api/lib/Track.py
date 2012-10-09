import requests
from api.settings import SERVICE_BASE_URL, BUS_TRACKER

class Search():
    """docstring for Search"""
    def __init__(self):
        pass

    def by_stop_code(self, stop_code):
        query_string = [
            SERVICE_BASE_URL,
            BUS_TRACKER,
            '?stop_code=',
            stop_code
        ]

        r = requests.get("".join(query_string))
        return r.json