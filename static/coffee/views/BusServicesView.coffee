define(
	[ 'underscore', 'backbone', 'templates/busServiceTmpl', 'models/BusStopModel' ]
    ( _, Backbone, busServiceTmpl, busStopModel )->
    	class BusServicesView extends Backbone.View

    		initialize: ->
                @tmpl =
                    serviceTmpl  : _.template(busServiceTmpl.individualBusTime())
                    allBusesTmpl : _.template(busServiceTmpl.displayAllBusesForStop())
                    stopInfo     : _.template(busServiceTmpl.displayBusStopInfo())
                @model.bind('reset', @render)

            getSpanWidth: ->
                width = parseInt(12 / @model.toJSON().length, 10)
                return 4 if width < 4
                width

            renderStopInfo: ->
                info = busStopModel.toJSON()
                $('#stop-info').html(
                    @tmpl.stopInfo(
                        stop_name: info.stop_name
                        stop_code: info.stop_code
                    )
                )

            createServiceTmpl: (bus) ->
                @tmpl.allBusesTmpl(
                    span_width     : @getSpanWidth()
                    service_number : bus.service_number
                    buses          : @tmpl.serviceTmpl(
                        time            : t.time
                        mins            : parseInt(t.mins, 10)
                        destination     : t.destination
                    ) for t in bus.due_times
                )

    		render: =>
                @renderStopInfo()
                buses = []
                buses.push(@createServiceTmpl(bus)) for bus in @model.toJSON()
                @$el.html($(buses.join('')))
                @$el.html(@$el.html().replace(/,/g, ''))
)