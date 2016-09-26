require 'rails_helper'

RSpec.describe NewslettersController, type: :controller do
  let(:newsletter) { create(:newsletter) }

  let(:valid_attributes) { attributes_for(:newsletter) }

  let(:invalid_attributes) { attributes_for(:newsletter, name: nil) }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :newsletter
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all newsletters as @newsletters" do
      get :index, params: {}, session: valid_session
      expect(assigns(:newsletters)).to eq([newsletter])
    end
  end

  describe "GET #show" do
    login_admin

    # it_loads_show_page :newsletter

    pending "assigns the requested newsletter as @newsletter"

    # it "assigns the requested newsletter as @newsletter" do
    #   newsletter = create(:newsletter)
    #   get :show, params: {id: newsletter.to_param}, session: valid_session
    #   expect(assigns(:newsletter)).to eq(newsletter)
    # end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new newsletter as @newsletter" do
      get :new, params: {}, session: valid_session
      expect(assigns(:newsletter)).to be_a_new(Newsletter)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :newsletter

    it "assigns the requested newsletter as @newsletter" do
      get :edit, params: {id: newsletter.to_param}, session: valid_session
      expect(assigns(:newsletter)).to eq(newsletter)
    end
  end

  describe "POST #create" do
    login_admin

    context "with valid params" do
      it "creates a new Newsletter" do
        expect {
          post :create, params: {newsletter: valid_attributes}, session: valid_session
        }.to change(Newsletter, :count).by(1)
        expect(flash[:success]).to eq "Newsletter was successfully created."
      end

      it "assigns a newly created newsletter as @newsletter" do
        post :create, params: {newsletter: valid_attributes}, session: valid_session
        expect(assigns(:newsletter)).to be_a(Newsletter)
        expect(assigns(:newsletter)).to be_persisted
      end

      # it "redirects to the created newsletter" do
      #   post :create, params: {newsletter: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(Newsletter.last)
      # end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved newsletter as @newsletter" do
        post :create, params: {newsletter: invalid_attributes}, session: valid_session
        expect(assigns(:newsletter)).to be_a_new(Newsletter)
      end

      it "re-renders the 'new' template" do
        post :create, params: {newsletter: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:newsletter, name: "New Newsletter")
      }

      it "updates the requested newsletter" do
        put :update, params: {id: newsletter.to_param, newsletter: new_attributes}, session: valid_session
        newsletter.reload
        expect(flash[:success]).to eq "Newsletter was successfully updated."
        expect(newsletter[:name]).to eq new_attributes[:name]
      end

      it "assigns the requested newsletter as @newsletter" do
        put :update, params: {id: newsletter.to_param, newsletter: valid_attributes}, session: valid_session
        expect(assigns(:newsletter)).to eq(newsletter)
      end

      # it "redirects to the newsletter" do
      #   put :update, params: {id: newsletter.to_param, newsletter: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(newsletter)
      # end
    end

    context "with invalid params" do
      it "assigns the newsletter as @newsletter" do
        put :update, params: {id: newsletter.to_param, newsletter: invalid_attributes}, session: valid_session
        expect(assigns(:newsletter)).to eq(newsletter)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: newsletter.to_param, newsletter: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    before :each do
      newsletter
    end
    it "destroys the requested newsletter" do
      expect {
        delete :destroy, params: {id: newsletter.to_param}, session: valid_session
      }.to change(Newsletter, :count).by(-1)
      expect(flash[:success]).to eq "Newsletter was successfully destroyed."
    end

    it "redirects to the newsletters list" do
      delete :destroy, params: {id: newsletter.to_param}, session: valid_session
      expect(response).to redirect_to(admin_newsletters_url)
    end
  end

end
