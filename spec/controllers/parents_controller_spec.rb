require 'rails_helper'

RSpec.describe ParentsController, type: :controller do
  let(:parent) { create(:parent) }

  let(:valid_attributes) { attributes_for(:parent) }

  let(:invalid_attributes) {
    attributes_for(:parent, email: nil, password: nil, title: nil,
                                         first_name: nil, last_name: nil )
  }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :parent
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all parents as @parents" do
      get :index, params: {}, session: valid_session
      expect(assigns(:parents)).to eq([parent])
    end
  end

  describe "GET #show" do
    login_admin

    it_loads_show_page :parent

    it "assigns the requested parent as @parent" do
      get :show, params: {id: parent.to_param}, session: valid_session
      expect(assigns(:parent)).to eq(parent)
    end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new parent as @parent" do
      get :new, params: {}, session: valid_session
      expect(assigns(:parent)).to be_a_new(Parent)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :parent

    it "assigns the requested parent as @parent" do
      get :edit, params: {id: parent.to_param}, session: valid_session
      expect(assigns(:parent)).to eq(parent)
    end
  end

  describe "POST #create" do
    login_admin

    context "with valid params" do
      it "creates a new Parent" do
        expect {
          post :create, params: {parent: valid_attributes}, session: valid_session
        }.to change(Parent, :count).by(1)
        expect(flash[:success]).to eq "Parent was successfully created."
      end

      it "assigns a newly created parent as @parent" do
        post :create, params: {parent: valid_attributes}, session: valid_session
        expect(assigns(:parent)).to be_a(Parent)
        expect(assigns(:parent)).to be_persisted
      end

      it "redirects to the created parent" do
        post :create, params: {parent: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Parent.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved parent as @parent" do
        post :create, params: {parent: invalid_attributes}, session: valid_session
        expect(assigns(:parent)).to be_a_new(Parent)
      end

      it "re-renders the 'new' template" do
        post :create, params: {parent: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:parent)
      }

      it "updates the requested parent" do
        put :update, params: {id: parent.to_param, parent: new_attributes}, session: valid_session
        parent.reload
        expect(flash[:success]).to eq "Parent was successfully updated."
        new_attributes.each_pair do |key, value|
          expect(parent[key]).to eq new_attributes[key] unless key == :password
        end
      end

      it "assigns the requested parent as @parent" do
        put :update, params: {id: parent.to_param, parent: valid_attributes}, session: valid_session
        expect(assigns(:parent)).to eq(parent)
      end

      it "redirects to the parent" do
        put :update, params: {id: parent.to_param, parent: valid_attributes}, session: valid_session
        expect(response).to redirect_to(parent)
      end
    end

    context "with invalid params" do
      it "assigns the parent as @parent" do
        put :update, params: {id: parent.to_param, parent: invalid_attributes}, session: valid_session
        expect(assigns(:parent)).to eq(parent)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: parent.to_param, parent: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    before :each do
      parent
    end
    it "destroys the requested parent" do
      expect {
        delete :destroy, params: {id: parent.to_param}, session: valid_session
      }.to change(Parent, :count).by(-1)
      expect(flash[:success]).to eq "Parent was successfully destroyed."
    end

    it "redirects to the parents list" do
      delete :destroy, params: {id: parent.to_param}, session: valid_session
      expect(response).to redirect_to(admin_parents_url)
    end
  end

end
