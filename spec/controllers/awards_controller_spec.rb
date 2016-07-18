require 'rails_helper'

RSpec.describe AwardsController, type: :controller do

  let(:award) { create(:award) }

  let(:valid_attributes) { attributes_for(:award) }

  let(:invalid_attributes) { attributes_for(:award, title: nil, description: nil) }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :award
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all awards as @awards" do
      get :index, params: {}, session: valid_session
      expect(assigns(:awards)).to eq([award])
    end
  end

  describe "GET #show" do
    login_admin

    it_loads_show_page :award

    it "assigns the requested award as @award" do
      get :show, params: {id: award.to_param}, session: valid_session
      expect(assigns(:award)).to eq(award)
    end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new award as @award" do
      get :new, params: {}, session: valid_session
      expect(assigns(:award)).to be_a_new(Award)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :award

    it "assigns the requested award as @award" do
      get :edit, params: {id: award.to_param}, session: valid_session
      expect(assigns(:award)).to eq(award)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      login_admin

      it "creates a new Award" do
        expect {
          post :create, params: {award: valid_attributes}, session: valid_session
        }.to change(Award, :count).by(1)
      expect(flash[:success]).to eq "Award was successfully created."
      end

      it "assigns a newly created award as @award" do
        post :create, params: {award: valid_attributes}, session: valid_session
        expect(assigns(:award)).to be_a(Award)
        expect(assigns(:award)).to be_persisted
      end

      it "redirects to the created award" do
        post :create, params: {award: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Award.last)
      end
    end

    context "with invalid params" do
      login_admin

      it "assigns a newly created but unsaved award as @award" do
        post :create, params: {award: invalid_attributes}, session: valid_session
        expect(assigns(:award)).to be_a_new(Award)
      end

      it "re-renders the 'new' template" do
        post :create, params: {award: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) { attributes_for(:award, title: "New Title") }

      it "updates the requested award" do
        put :update, params: {id: award.to_param, award: new_attributes}, session: valid_session
        award.reload
        new_attributes.each_pair do |key, value|
          expect(award[key]).to eq new_attributes[key]
        end
        expect(flash[:success]).to eq "Award was successfully updated."
      end

      it "assigns the requested award as @award" do
        put :update, params: {id: award.to_param, award: valid_attributes}, session: valid_session
        expect(assigns(:award)).to eq(award)
      end

      it "redirects to the award" do
        put :update, params: {id: award.to_param, award: valid_attributes}, session: valid_session
        expect(response).to redirect_to(award)
      end
    end

    context "with invalid params" do
      it "assigns the award as @award" do
        put :update, params: {id: award.to_param, award: invalid_attributes}, session: valid_session
        expect(assigns(:award)).to eq(award)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: award.to_param, award: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin
    before :each do
      award
    end

    it "destroys the requested award" do
      expect {
        delete :destroy, params: {id: award.to_param}, session: valid_session
      }.to change(Award, :count).by(-1)
    expect(flash[:success]).to eq "Award was successfully destroyed."
    end

    it "redirects to the awards list" do
      delete :destroy, params: {id: award.to_param}, session: valid_session
      expect(response).to redirect_to(awards_url)
    end
  end
end
