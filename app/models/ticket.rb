class Ticket < ActiveRecord::Base
  belongs_to 	:user
  has_many		:note
  
  attr_accessible :description, :title, :user
  attr_reader :created_at, :updated_at
  
end
