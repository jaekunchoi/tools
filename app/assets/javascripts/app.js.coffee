#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

App.Store = DS.Store.extend(
  revision: 12
  adapter: "DS.RESTAdapter" # "DS.FixtureAdapter"
)
