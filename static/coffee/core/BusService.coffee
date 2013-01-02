define(
	['jquery', 'models/BusServiceModel', 'models/BusServiceCollection'],
	($, BusServiceModel, BusServiceCollection) ->
		class BusService

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
                coll = new BusServiceCollection(buses)
                console.log coll
)