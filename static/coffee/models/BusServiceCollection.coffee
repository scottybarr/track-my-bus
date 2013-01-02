define(
	['backbone', 'models/BusServiceModel'],
	(Backbone, BusServiceModel) ->

		class BusServiceCollection extends Backbone.Collection
			
			model: BusServiceModel
)