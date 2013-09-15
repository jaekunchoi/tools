require 'spec_helper'

describe Ticket do

	before(:each) do
		@user = FactoryGirl.create(:user)
		$attr = {
			:title => "Test Ticket",
			:description => "This is a test ticket for CommStrat",
			:user => @user,
		}
	end

	it "should create a new ticket" do
		Ticket.create!($attr)
	end
	
end
