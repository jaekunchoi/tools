class UserMailer < ActionMailer::Base
  default from: "tools@commstrat.com.au"

  def ticket_created(ticket)
  	@ticket = ticket
  	mail(:to => "#{ticket.user.name} <#{ticket.user.email}>", :subject => "Ticket id (ticket.id) is created")
  end

  def ticket_created_admin(ticket)
  	@ticket = ticket
  	mail(:to => "#{ENV['ADMIN_NAME']} <#{ENV['ADMIN_EMAIL']}>", :subject => "Ticket id (ticket.id) is created")
  end

  def note_created_admin(note)
  	@note = note
  	mail(:to => "#{ENV['ADMIN_NAME']} <#{ENV['ADMIN_EMAIL']}>", :subject => "New note for ticket id (note.ticket.id)")
  end
end
