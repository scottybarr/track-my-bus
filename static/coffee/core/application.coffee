define(
    [ 'jquery', 'underscore', 'backbone', 'views/BusServicesView',
        'models/BusServiceModel', 'models/BusServiceCollection',
        'models/BusStopModel', 'core/router']
    ( $, _, Backbone, BusServicesView, BusServiceModel, BusServiceCollection,
      busStopModel, router )->
        new class Application
            init: ->
                @initRouterEvents()
                Backbone.history.start(pushState: true)
                @initModels()
                @initViews()

            initRouterEvents: ->
                router.on('route:track', @track)
                router.on('route:defaultRoute', => @getBuses())

            initModels: -> @busCollection = new BusServiceCollection([])

            initViews: ->
                @busView = new BusServicesView(
                    el: $('#stop-container')
                    model: @busCollection
                )

            getBuses: (stopCode=36239637) ->
                $.ajax(
                    url: "/api/#{stopCode}/",
                    success: (obj, resp, err) =>
                        @mapBusStopToModel(obj.stop_info)
                        @mapBusServicesToModel(obj)
                )

            mapBusStopToModel: (stop_info) -> busStopModel.set(stop_info)

            mapBusServicesToModel: (data) ->
                buses = []
                for service in data.services
                    buses.push(new BusServiceModel(
                        service_number  : service.service_name
                        due_times       : service.times
                    ))
                @busCollection.reset(buses)

            track: (stopCode) => @getBuses(stopCode) if @_validateStopCode(stopCode)

            _validateStopCode: (stopCode) -> stopCode.length is 8
)