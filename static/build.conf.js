({
    baseUrl      : ".",
    appDir       : "./js",
    dir          : "js/",
    optimize     : "none",
    keepBuildDir : true,

    paths: {
        jquery     : 'vendor/jquery/jquery-1.8.1.min',
        underscore : 'vendor/underscore/underscore-min',
        backbone   : 'vendor/backbone/backbone-min'
    },

    modules: [
        {
            name : "core/main"
        }
    ]
})