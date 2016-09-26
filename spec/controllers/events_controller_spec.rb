require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) { create(:event) }

  let(:valid_attributes) { attributes_for(:event) }

  let(:invalid_attributes) {
    attributes_for(:event, start_date: nil, end_date: nil, description: nil)
  }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :event
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all events as @events" do
      get :index, params: {}, session: valid_session
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET #show" do
    login_admin

    it_loads_show_page :event

    it "assigns the requested event as @event" do
      get :show, params: {id: event.to_param}, session: valid_session
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new event as @event" do
      get :new, params: {}, session: valid_session
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :event

    it "assigns the requested event as @event" do
      get :edit, params: {id: event.to_param}, session: valid_session
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "POST #create" do
    login_admin

    context "with valid params" do
      it "creates a new event" do
        expect {
          post :create, params: {event: valid_attributes}, session: valid_session
        }.to change(Event, :count).by(1)
        expect(flash[:success]).to eq "Event was successfully created."
      end

      it "assigns a newly created event as @event" do
        post :create, params: {event: valid_attributes}, session: valid_session
        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it "redirects to the created event" do
        post :create, params: {event: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Event.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        post :create, params: {event: invalid_attributes}, session: valid_session
        expect(assigns(:event)).to be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        post :create, params: {event: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:event, start_date: Date.today + 2,
                                            end_date: Date.today + 4)
      }

      it "updates the requested event" do
        put :update, params: {id: event.to_param, event: new_attributes}, session: valid_session
        event.reload
        expect(flash[:success]).to eq "Event was successfully updated."
        new_attributes.each_pair do |key, value|
          expect(event[key]).to eq new_attributes[key]
        end
      end

      it "assigns the requested event as @event" do
        put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
        expect(assigns(:event)).to eq(event)
      end

      it "redirects to the event" do
        put :update, params: {id: event.to_param, event: valid_attributes}, session: valid_session
        expect(response).to redirect_to(event)
      end
    end

    context "with invalid params" do
      it "assigns the event as @event" do
        put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
        expect(assigns(:event)).to eq(event)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: event.to_param, event: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    before :each do
      event
    end
    it "destroys the requested event" do
      expect {
        delete :destroy, params: {id: event.to_param}, session: valid_session
      }.to change(Event, :count).by(-1)
      expect(flash[:success]).to eq "Event was successfully destroyed."
    end

    it "redirects to the events list" do
      delete :destroy, params: {id: event.to_param}, session: valid_session
      expect(response).to redirect_to(admin_events_url)
    end
  end

end
