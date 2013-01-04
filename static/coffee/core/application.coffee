define(
    [ 'jquery', 'underscore', 'backbone', 'views/BusServicesView',
        'models/BusServiceModel', 'models/BusServiceCollection',
        'models/BusStopModel']
    ( $, _, Backbone, BusServicesView, BusServiceModel, BusServiceCollection,
      busStopModel )->
        new class Application
            init: ->
                @initModels()
                @initViews()
                @getBuses()

            initModels: ->
                @busCollection = new BusServiceCollection([])

            initViews: ->
                @busView = new BusServicesView(
                    el: $('#stop-container')
                    model: @busCollection
                )

            getBuses: ->
                $.ajax(
                    url: '/api/36239637/',
                    success: (obj, resp, err) =>
                        @mapBusStopToModel(obj.stop_info)
                        @mapBusServicesToModel(obj)
                )

            mapBusStopToModel: (stop_info) ->
                busStopModel.set(stop_info)

            mapBusServicesToModel: (data) ->
                buses = []
                for service in data.services
                    buses.push(new BusServiceModel(
                        service_number: service.service_name
                        due_times: service.times
                    ))
                @busCollection.reset(buses)
)