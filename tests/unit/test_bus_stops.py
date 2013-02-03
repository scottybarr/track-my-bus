import unittest
from mock import Mock, patch
from api.bus_stops import BusStops


class MockRequests:
    def __init__(self):
        self.text = '{"hello": "world"}'

    def get(self, url):
        return self


class TestBusStops(unittest.TestCase):
    @patch('api.bus_stops.requests', MockRequests())
    @patch('api.bus_stops.SERVICE_BASE_URL', 'http://test.local')
    @patch('api.bus_stops.BUS_TRACKER', 'bus_tracker.php')
    def setUp(self):
        self.bus_stops = BusStops()
        self.stop_info = self.bus_stops.by_stop_code(1234)

    def test_search_by_stop_id_returns_something(self):
        self.assertIsNotNone(self.stop_info)

    def test_search_by_stop_id_returns_dict(self):
        self.assertEqual(self.stop_info['hello'], 'world')


if __name__ == "__main__":
    unittest.main()
