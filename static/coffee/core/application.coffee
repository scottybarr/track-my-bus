define(
    [ 'jquery', 'underscore', 'backbone' ]
    ( $, _, Backbone )->
    	new class Application
    		init: ->
    			console.log 'App'
)