require 'rails_helper'


RSpec.describe AdminsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Admin. As you add validations to Admin, be sure to
  # adjust the attributes here as well.

  let(:admin){ create(:admin) }

  let(:valid_attributes) { attributes_for(:admin) }

  let(:invalid_attributes) { attributes_for(:admin, email: nil, password: nil) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdminsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  unauthorized_user_is_redirected :admin


  describe "GET #index" do
    describe "when user is authorized" do
      # creates @super_admin, controler_macros.rb
      login_super_admin

      it_loads_index_page

      it "assigns all admins as @admins" do
        get :index, params: {}, session: valid_session
        expect(assigns(:admins)).to eq([@super_admin, admin])
      end
    end
  end

  describe "GET #show" do
    describe "when user is authorized" do
      login_super_admin # creates @admin

      it_loads_show_page :admin

      context "and params are valid" do
        it "should assign requested admin as @admin" do
          get :show, params: { id: admin.to_param }, session: valid_session
          expect(assigns(:admin)).to eq admin
        end
      end
    end
  end

  describe "GET #new" do
    describe "when user is authorized" do
      login_super_admin

      it "assigns a new admin as @admin" do
        get :new, params: {}, session: valid_session
        expect(assigns(:admin)).to be_a_new(Admin)
      end
    end
  end

  describe "GET #edit" do
    describe "when user is authorized" do
      login_super_admin

      it_loads_edit_page :admin

      it "assigns the requested admin as @admin" do
          get :edit, params: {id: admin.to_param}, session: valid_session
          expect(assigns(:admin)).to eq admin
      end
    end
  end

  describe "POST #create" do
    describe "when user is authorized" do
      login_super_admin

      context "with valid params" do
        it "creates a new Admin" do
          expect {
            post :create, params: {admin: valid_attributes}, session: valid_session
          }.to change(Admin, :count).by(1)
        end

        it "assigns a newly created admin as @admin" do
          post :create, params: {admin: valid_attributes}, session: valid_session
          expect(assigns(:admin)).to be_a(Admin)
          expect(assigns(:admin)).to be_persisted
        end

        it "redirects to the created admin" do
          post :create, params: {admin: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Admin.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved admin as @admin" do
          post :create, params: {admin: invalid_attributes}, session: valid_session
          expect(assigns(:admin)).to be_a_new(Admin)
        end

        it "re-renders the 'new' template" do
          post :create, params: {admin: invalid_attributes}, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end

  describe "PUT #update" do
    describe "when user is authorized" do
      login_super_admin

      context "with valid params" do
        let(:new_attributes) {
          attributes_for (:admin)
        }

        it "updates the requested admin" do
          put :update, params: {id: admin.to_param, admin: new_attributes}, session: valid_session
          admin.reload
          expect(admin.username).to eq new_attributes[:username]
          expect(admin.email).to eq new_attributes[:email]
        end

        it "assigns the requested admin as @admin" do
          put :update, params: {id: admin.to_param, admin: valid_attributes}, session: valid_session
          expect(assigns(:admin)).to eq(admin)
        end

        it "redirects to the admin" do
          put :update, params: {id: admin.to_param, admin: valid_attributes}, session: valid_session
          expect(response).to redirect_to(admin)
        end
      end

      context "with invalid params" do
        it "assigns the admin as @admin" do
          put :update, params: {id: admin.to_param, admin: invalid_attributes}, session: valid_session
          expect(assigns(:admin)).to eq(admin)
        end

        it "re-renders the 'edit' template" do
          put :update, params: {id: admin.to_param, admin: invalid_attributes}, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "DELETE #destroy" do
    describe "when user is authorized" do
      login_super_admin

      before :each do
        admin
      end

      it "destroys the requested admin" do
        expect {
          delete :destroy, params: {id: admin.to_param}, session: valid_session
        }.to change(Admin, :count).by(-1)
      end

      it "redirects to the admins list" do
        delete :destroy, params: {id: admin.to_param}, session: valid_session
        expect(response).to redirect_to(admins_url)
      end

    end
  end
end
