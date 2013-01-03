define(
	[ 'underscore', 'backbone', 'templates/busServiceTmpl' ]
    ( _, Backbone, busServiceTmpl )->
    	class BusServicesView extends Backbone.View

    		initialize: ->
                @tmpl =
                    serviceTmpl: _.template(busServiceTmpl.individualBusTime())
                    allBusesTmpl: _.template(busServiceTmpl.displayAllBusesForStop())
                @model.bind('reset', @render)

            getSpanWidth: ->
                parseInt(12 / @model.toJSON().length, 10)

    		render: =>
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
                console.log(buses)
                @$el.html($(buses.join('')))
)
