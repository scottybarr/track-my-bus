from flask import Flask, render_template, jsonify
from api.stops import Stops
from datetime import datetime

app = Flask(__name__)


@app.route('/')
def index():
    return render_home_page()


@app.route('/track/')
def track_page():
    return render_home_page()


@app.route('/track/<stop>/')
def track_page_stop(stop):
    return render_home_page()


@app.route('/api/<bus_stop_code>/')
def json_stop(bus_stop_code):
    return jsonify(Stops().by_stop_code(bus_stop_code))


def render_home_page():
    return render_template('index.html', **get_page_data())


def get_page_data():
    return {'year': datetime.now().year}

if __name__ == '__main__':
    app.run(debug=True)
