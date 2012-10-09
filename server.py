from flask import Flask, render_template, jsonify
from api.lib.Stops import Stops

app = Flask(__name__)


STOPS = Stops()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/stops/<bus_stop_code>/')
def search_by_stop_code(bus_stop_code):
    return jsonify(STOPS.search_by_stop_code(bus_stop_code))

@app.route('/stops/<lat>/<long>/')
def search_by_lat_long(lat, long):
    return jsonify(STOPS.search_by_lat_long(lat, long))

if __name__ == '__main__':
    app.run(debug=True)
