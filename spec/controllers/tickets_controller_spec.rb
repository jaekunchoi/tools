require 'spec_helper'

describe TicketsController do

  before(:each) do
    @user ||= FactoryGirl.create(:user)
    sign_in @user
  end

  let(:valid_attributes) { { :title => "Random Title", :description => "Hello this is description"  } }

  describe "GET index" do
    it "assigns all tickets as @tickets" do
      ticket = Ticket.create! valid_attributes
      get :index
      assigns(:tickets).should eq([ticket])
    end
  end

  describe "GET show" do
    it "assigns the requested ticket as @ticket" do
      ticket = Ticket.create! valid_attributes
      get :show, {:id => ticket.to_param}
      assigns(:ticket).should eq(ticket)
    end
  end

  describe "GET new" do
    it "assigns a new ticket as @ticket" do
      get :new, {}
      assigns(:ticket).should be_a_new(Ticket)
    end
  end

  describe "GET edit" do
    it "assigns the requested ticket as @ticket" do
      ticket = Ticket.create! valid_attributes
      get :edit, {:id => ticket.to_param}
      assigns(:ticket).should eq(ticket)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ticket" do
        expect {
          post :create, {:ticket => valid_attributes}
        }.to change(Ticket, :count).by(1)
      end

      it "assigns a newly created ticket as @ticket" do
        post :create, {:ticket => valid_attributes}
        assigns(:ticket).should be_a(Ticket)
        assigns(:ticket).should be_persisted
      end

      it "redirects to the created ticket" do
        post :create, {:ticket => valid_attributes}
        response.should redirect_to(Ticket.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ticket as @ticket" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ticket.any_instance.stub(:save).and_return(false)
        post :create, {:ticket => { "title" => "invalid value" }}
        assigns(:ticket).should be_a_new(Ticket)
      end

      it "re-renders the 'new' template" do
        Ticket.any_instance.stub(:save).and_return(false)
        post :create, {:ticket => { "title" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ticket" do
        ticket = Ticket.create! valid_attributes
        Ticket.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => ticket.to_param, :ticket => { "title" => "MyString" }}
      end

      it "assigns the requested ticket as @ticket" do
        ticket = Ticket.create! valid_attributes
        put :update, {:id => ticket.to_param, :ticket => valid_attributes}
        assigns(:ticket).should eq(ticket)
      end

      it "redirects to the ticket" do
        ticket = Ticket.create! valid_attributes
        put :update, {:id => ticket.to_param, :ticket => valid_attributes}
        response.should redirect_to(ticket)
      end
    end

    describe "with invalid params" do
      it "assigns the ticket as @ticket" do
        ticket = Ticket.create! valid_attributes
        Ticket.any_instance.stub(:save).and_return(false)
        put :update, {:id => ticket.to_param, :ticket => { "title" => "invalid value" }}
        assigns(:ticket).should eq(ticket)
      end

      it "re-renders the 'edit' template" do
        ticket = Ticket.create! valid_attributes
        Ticket.any_instance.stub(:save).and_return(false)
        put :update, {:id => ticket.to_param, :ticket => { "title" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ticket" do
      ticket = Ticket.create! valid_attributes
      expect {
        delete :destroy, {:id => ticket.to_param}
      }.to change(Ticket, :count).by(-1)
    end

    it "redirects to the tickets list" do
      ticket = Ticket.create! valid_attributes
      delete :destroy, {:id => ticket.to_param}
      response.should redirect_to(tickets_url)
    end
  end

end
