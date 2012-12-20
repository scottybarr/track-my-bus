define(
	['underscore', 'Backbone'],
	(_, Backbone) ->
		class BusServiceModel extends Backbone.Model

			defaults:
				service_number: null
				stop_code: null
				due_times: []
				service_info: {}
)