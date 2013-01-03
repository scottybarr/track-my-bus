define(
	[ 'underscore', 'backbone', 'templates/busServiceTmpl' ]
    ( _, Backbone, busServiceTmpl )->
    	class BusServicesView extends Backbone.View

    		initialize: ->
                @tmpl =
                    serviceTmpl : _.template(busServiceTmpl.individualBusTime())
                    allBusesTmpl: _.template(busServiceTmpl.displayAllBusesForStop())
                    stopInfo    : _.template(busServiceTmpl.displayBusStopInfo())
                @model.bind('reset', @render)

            getSpanWidth: ->
                parseInt(12 / @model.toJSON().length, 10)

            renderStopInfo: ->
                info = @model.toJSON()[0].stop_info
                $('#stop-info').html(
                    @tmpl.stopInfo(
                        stop_name: info.stop_name
                        stop_code: info.stop_code
                    )
                )

    		render: =>
                @renderStopInfo()
                buses = []
                buses.push(@tmpl.allBusesTmpl(
                    span_width: @getSpanWidth()
                    service_number: bus.service_number
                    buses: @tmpl.serviceTmpl(
                            time: t.time
                            mins: parseInt(t.mins, 10)
                            destination: t.destination
                    ) for t in bus.due_times
                )) for bus in @model.toJSON()
                @$el.html($(buses.join(''))
)
