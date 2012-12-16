from flask import Flask, render_template
from api.lib.Stops import Stops
from api.lib.Track import Search
from datetime import datetime

app = Flask(__name__)

STOPS = Stops()
TRACK = Search()


@app.route('/')
def index():
    return render_template('index.html', **get_page_data())


@app.route('/track/<bus_stop_code>/')
def search_by_stop_code(bus_stop_code):
    return render_template('index.html', **get_page_data(bus_stop_code))


def get_page_data(stop_code=36239637):
    buses = STOPS.by_stop_code(stop_code)
    return {
        'year': datetime.now().year,
        'buses': buses,
        'span_width': int(12 / len(buses))
    }

if __name__ == '__main__':
    app.run(debug=True)
