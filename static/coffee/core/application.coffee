define(
    [ 'jquery', 'underscore', 'backbone', 'views/BusServicesView',
        'models/BusServiceModel', 'models/BusServiceCollection' ]
    ( $, _, Backbone, BusServicesView, BusServiceModel, BusServiceCollection )->
        new class Application
            init: ->
                @initModels()
                @initViews()
                @getBuses()

            initModels: ->
                @busCollection = new BusServiceCollection([])

            initViews: ->
                @busView = new BusServicesView(
                    model: @busCollection
                )

            getBuses: ->
                $.ajax(
                    url: '/api/36239637/',
                    success: (obj, resp, err) =>
                        @mapBusServicesToModel(obj)
                )

            mapBusServicesToModel: (data) ->
                buses = []
                for service in data.services
                    buses.push(new BusServiceModel(
                        service_number: service.service_name
                        stop_code: data.stop_info.stop_code
                        due_times: service.times
                        stop_info: data.stop_info
                    ))
                @busCollection.reset(buses)
)