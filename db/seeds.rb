# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'Users'
user = User.find_or_create_by_email({
	:name => "Ric Perere",
	:email => "ric.perere@commstrat.com.au",
	:password => "perere",
	:password_confirmation => "perere"
	});

puts 'Tickets'
ticket = Ticket.find_or_create_by_title({
	:title => "First Ticket", 
	:description => "This is my first ticket",
	:user_id => 1
	}, :without_protection => true)

puts 'Notes'
Note.find_or_create_by_description({
	:description => "This is the first note",
	:ticket_id => 1,
	:user_id => 1
	}, :without_protection => true)

Note.find_or_create_by_description({
	:description => "This is the second note",
	:ticket_id => 1,
	:user_id => 1
	}, :without_protection => true)