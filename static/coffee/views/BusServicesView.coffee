define(
	[ 'underscore', 'backbone' ]
    ( _, Backbone )->
    	class BusServicesView extends Backbone.View
    		
    		el: $('#stop-container')

    		initialize: ->
                console.log 'initialized view'

    		render: ->
                console.log 'rendering!'
)