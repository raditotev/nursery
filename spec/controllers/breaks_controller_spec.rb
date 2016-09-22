require 'rails_helper'

RSpec.describe BreaksController, type: :controller do
  let(:closure) { create(:break) }

  let(:valid_attributes) { attributes_for(:break) }

  let(:invalid_attributes) {
    attributes_for(:break, start_date: nil, end_date: nil, description: nil)
  }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :break
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all breaks as @breaks" do
      get :index, params: {}, session: valid_session
      expect(assigns(:breaks)).to eq([closure])
    end
  end

  describe "GET #show" do
    login_admin

    it_loads_show_page :break

    it "assigns the requested break as @break" do
      get :show, params: {id: closure.to_param}, session: valid_session
      expect(assigns(:break)).to eq(closure)
    end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new break as @closure" do
      get :new, params: {}, session: valid_session
      expect(assigns(:break)).to be_a_new(Break)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :break

    it "assigns the requested break as @break" do
      get :edit, params: {id: closure.to_param}, session: valid_session
      expect(assigns(:break)).to eq(closure)
    end
  end

  describe "POST #create" do
    login_admin

    context "with valid params" do
      it "creates a new Break" do
        expect {
          post :create, params: {break: valid_attributes}, session: valid_session
        }.to change(Break, :count).by(1)
        expect(flash[:success]).to eq "Break was successfully created."
      end

      it "assigns a newly created break as @break" do
        post :create, params: {break: valid_attributes}, session: valid_session
        expect(assigns(:break)).to be_a(Break)
        expect(assigns(:break)).to be_persisted
      end

      it "redirects to the created break" do
        post :create, params: {break: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Break.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved break as @break" do
        post :create, params: {break: invalid_attributes}, session: valid_session
        expect(assigns(:break)).to be_a_new(Break)
      end

      it "re-renders the 'new' template" do
        post :create, params: {break: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:break, start_date: Date.today + 2,
                                            end_date: Date.today + 4)
      }

      it "updates the requested break" do
        put :update, params: {id: closure.to_param, break: new_attributes}, session: valid_session
        closure.reload
        expect(flash[:success]).to eq "Break was successfully updated."
        new_attributes.each_pair do |key, value|
          expect(closure[key]).to eq new_attributes[key]
        end
      end

      it "assigns the requested break as @break" do
        put :update, params: {id: closure.to_param, break: valid_attributes}, session: valid_session
        expect(assigns(:break)).to eq(closure)
      end

      it "redirects to the break" do
        put :update, params: {id: closure.to_param, break: valid_attributes}, session: valid_session
        expect(response).to redirect_to(closure)
      end
    end

    context "with invalid params" do
      it "assigns the break as @break" do
        put :update, params: {id: closure.to_param, break: invalid_attributes}, session: valid_session
        expect(assigns(:break)).to eq(closure)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: closure.to_param, break: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    before :each do
      closure
    end
    it "destroys the requested break" do
      expect {
        delete :destroy, params: {id: closure.to_param}, session: valid_session
      }.to change(Break, :count).by(-1)
      expect(flash[:success]).to eq "Break was successfully destroyed."
    end

    it "redirects to the breaks list" do
      delete :destroy, params: {id: closure.to_param}, session: valid_session
      expect(response).to redirect_to(admin_breaks_url)
    end
  end

end
