require.config(
    baseUrl : "#{STATIC_URL}js/"
    paths :
        jquery     : "#{STATIC_URL}js/vendor/jquery/jquery-1.8.1.min"
        underscore : "#{STATIC_URL}js/vendor/underscore/underscore-min"
        backbone   : "#{STATIC_URL}js/vendor/backbone/backbone-min"

    shim :
        'backbone' :
            deps    : ['underscore']
            exports : 'Backbone'
)
require(
    [ 'core/application' ]
    ( app )->
        app.init() if ( INIT_APPLICATION ? false )
)