require.config(
    baseUrl : "js_build/"
    paths :
        jquery     : "js_build/vendor/jquery/jquery-1.8.1.min"
        underscore : "js_build/vendor/underscore/underscore-min"
        backbone   : "js_build/vendor/backbone/backbone-min"
)
require(
    [ 'core/application' ]
    ( app )->
        app.init() if ( INIT_APPLICATION ? false )
)