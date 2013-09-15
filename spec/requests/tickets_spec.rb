require 'spec_helper'

describe "Tickets" do

  describe "GET /tickets" do
    it "should not be allowed without logging in" do
      get tickets_path
      response.status.should be(302)
    end
  end
end
