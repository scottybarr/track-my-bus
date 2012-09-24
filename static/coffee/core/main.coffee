require.config(
    baseUrl : "static/js/"
    paths :
        jquery     : "vendor/jquery/jquery-1.8.1.min"
        underscore : "vendor/underscore/underscore-min"
        backbone   : "vendor/backbone/backbone-min"
)
require(
    [ 'core/application' ]
    ( app )->
        app.init()
)