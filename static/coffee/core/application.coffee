define(
    [ 'jquery', 'underscore', 'backbone', 'core/BusService' ]
    ( $, _, Backbone, BusService )->
    	  new class Application
    		    init: ->
                    @bus = new BusService()
                    @bus.getBuses()
)