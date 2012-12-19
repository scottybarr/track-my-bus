from flask import Flask, render_template, jsonify
from api.Stops import Stops
from datetime import datetime

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html', **get_page_data())


@app.route('/track/<bus_stop_code>/')
def search_by_stop_code(bus_stop_code):
    return render_template('index.html', **get_page_data(bus_stop_code))


@app.route('/api/<bus_stop_code>/')
def json_stop(bus_stop_code):
    return jsonify(Stops().by_stop_code(bus_stop_code))


def get_page_data(stop_code=36239637):
    buses = Stops().by_stop_code(stop_code)
    return {
        'year': datetime.now().year,
        'buses': buses,
        'span_width': int(12 / len(buses))
    }

if __name__ == '__main__':
    app.run(debug=True)
