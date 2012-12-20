define(
	['models/BusServiceModel'],
	(BusServiceModel) ->

		class BusServiceCollection extends Backbone.Collection
			
			model: BusServiceModel
)