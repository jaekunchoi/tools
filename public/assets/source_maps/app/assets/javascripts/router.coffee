# For more information see: http://emberjs.com/guides/routing/

App.Router.map ->
	@resource "tickets", ->
		@resource "ticket",
			path: ":ticket_id"
