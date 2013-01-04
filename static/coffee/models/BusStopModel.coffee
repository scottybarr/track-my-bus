define(
    ['backbone']
    (Backbone) ->
        new class BusStopModel extends Backbone.Model

            defaults:
                stop_code: 0
                stop_name: ''
                latitude: 0.0
                longitude: 0.0
                direction: ''
                service_list: []
)