require.config(
    baseUrl : "/static/js/"
    paths :
        jquery     : "/static/js/vendor/jquery-1.8.3.min"
        underscore : "/static/js/vendor/underscore-min"
        backbone   : "/static/js/vendor/backbone-min"

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