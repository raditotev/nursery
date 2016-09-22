require 'rails_helper'

RSpec.describe FaqsController, type: :controller do
  let(:faq) { create(:faq) }

  let(:valid_attributes) {
    attributes_for(:faq)
  }

  let(:invalid_attributes) {
    attributes_for(:faq, question: nil, answer: nil)
  }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :faq
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all faqs as @faqs" do
      get :index, params: {}, session: valid_session
      expect(assigns(:faqs)).to eq([faq])
    end
  end

  describe "GET #show" do
    login_admin

    it_loads_show_page :faq

    it "assigns the requested faq as @faq" do
      get :show, params: {id: faq.to_param}, session: valid_session
      expect(assigns(:faq)).to eq(faq)
    end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new faq as @faq" do
      get :new, params: {}, session: valid_session
      expect(assigns(:faq)).to be_a_new(Faq)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :faq

    it "assigns the requested faq as @faq" do
      faq = Faq.create! valid_attributes
      get :edit, params: {id: faq.to_param}, session: valid_session
      expect(assigns(:faq)).to eq(faq)
    end
  end

  describe "POST #create" do
    login_admin

    context "with valid params" do
      it "creates a new Faq" do
        expect {
          post :create, params: {faq: valid_attributes}, session: valid_session
        }.to change(Faq, :count).by(1)
        expect(flash[:success]).to eq "FAQ was successfully created."
      end

      it "assigns a newly created faq as @faq" do
        post :create, params: {faq: valid_attributes}, session: valid_session
        expect(assigns(:faq)).to be_a(Faq)
        expect(assigns(:faq)).to be_persisted
      end

      it "redirects to the created faq" do
        post :create, params: {faq: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Faq.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved faq as @faq" do
        post :create, params: {faq: invalid_attributes}, session: valid_session
        expect(assigns(:faq)).to be_a_new(Faq)
      end

      it "re-renders the 'new' template" do
        post :create, params: {faq: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:faq, question: "New Question", answer: "New answer")
      }

      it "updates the requested faq" do
        put :update, params: {id: faq.to_param, faq: new_attributes}, session: valid_session
        faq.reload
        expect(flash[:success]).to eq "FAQ was successfully updated."
        new_attributes.each_pair do |key, value|
          expect(faq[key]).to eq new_attributes[key]
        end
      end

      it "assigns the requested faq as @faq" do
        put :update, params: {id: faq.to_param, faq: valid_attributes}, session: valid_session
        expect(assigns(:faq)).to eq(faq)
      end

      it "redirects to the faq" do
        put :update, params: {id: faq.to_param, faq: valid_attributes}, session: valid_session
        expect(response).to redirect_to(faq)
      end
    end

    context "with invalid params" do
      it "assigns the faq as @faq" do
        put :update, params: {id: faq.to_param, faq: invalid_attributes}, session: valid_session
        expect(assigns(:faq)).to eq(faq)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: faq.to_param, faq: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    before :each do
      faq
    end

    it "destroys the requested faq" do
      expect {
        delete :destroy, params: {id: faq.to_param}, session: valid_session
      }.to change(Faq, :count).by(-1)
      expect(flash[:success]).to eq "FAQ was successfully destroyed."
    end

    it "redirects to the faqs list" do
      delete :destroy, params: {id: faq.to_param}, session: valid_session
      expect(response).to redirect_to(admin_faqs_url)
    end
  end
end
