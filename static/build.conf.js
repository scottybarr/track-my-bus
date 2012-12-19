({
    baseUrl      : ".",
    appDir       : "./js",
    dir          : "js/",
    optimize     : "none",
    keepBuildDir : true,

    paths: {
        jquery     : 'vendor/jquery/jquery-1.8.2',
        underscore : 'vendor/lodash/lodash-0.9.1',
        backbone   : 'vendor/backbone/backbone-0.9.2',
    },

    shim: {
        'backbone': {
            deps    : ['underscore', 'jquery'],
            exports : 'Backbone'
        }
    },

    modules: [
        {
            name : "core/main"
        }
    ]
})