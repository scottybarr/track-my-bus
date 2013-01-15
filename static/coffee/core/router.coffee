define(
    ['backbone', 'core/application'],
    (Backbone, app) ->
        new class Router extends Backbone.Router

            routes:
                "track/:stopCode" : "track"
                "*actions"        : "defaultRoute"
)