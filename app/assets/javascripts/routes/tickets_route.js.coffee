App.TicketsRoute = Ember.Route.extend
	model: ->
		App.Ticket.find()