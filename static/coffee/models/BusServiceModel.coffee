define(
	['underscore', 'backbone'],
	(_, Backbone) ->
		class BusServiceModel extends Backbone.Model

			defaults:
				service_number: null
				stop_code: null
				due_times: []
				stop_info: {}
)