define(
	['underscore', 'backbone'],
	(_, Backbone) ->
		class BusServiceModel extends Backbone.Model

			defaults:
				service_number: null
				due_times: []
)