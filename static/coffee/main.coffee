require.config(
    baseUrl : "/static/js/"
    paths :
        jquery     : "/static/js/vendor/jquery/jquery-1.8.1.min"
        underscore : "/static/js/vendor/underscore/underscore-min"
        backbone   : "/static/js/vendor/backbone/backbone-min"

    shim :
        'backbone' :
            deps    : ['underscore']
            exports : 'Backbone'
)
require(
    [ 'core/application' ]
    ( app )->
        app.init()
)