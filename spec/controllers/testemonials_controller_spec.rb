require 'rails_helper'

RSpec.describe TestemonialsController, type: :controller do
  let(:testemonial) { create(:testemonial) }

  let(:valid_attributes) { attributes_for(:testemonial) }

  let(:invalid_attributes) { attributes_for(:testemonial, title: nil, description: nil) }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :testemonial
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all testemonials as @testemonials" do
      get :index, params: {}, session: valid_session
      expect(assigns(:testemonials)).to eq([testemonial])
    end
  end

  describe "GET #show" do
    login_admin

    it_loads_show_page :testemonial

    it "assigns the requested testemonial as @testemonial" do
      get :show, params: {id: testemonial.to_param}, session: valid_session
      expect(assigns(:testemonial)).to eq(testemonial)
    end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new testemonial as @testemonial" do
      get :new, params: {}, session: valid_session
      expect(assigns(:testemonial)).to be_a_new(Testemonial)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :testemonial

    it "assigns the requested testemonial as @testemonial" do
      get :edit, params: {id: testemonial.to_param}, session: valid_session
      expect(assigns(:testemonial)).to eq(testemonial)
    end
  end

  describe "POST #create" do
    login_admin

    context "with valid params" do
      it "creates a new Testemonial" do
        expect {
          post :create, params: {testemonial: valid_attributes}, session: valid_session
        }.to change(Testemonial, :count).by(1)
        expect(flash[:success]).to eq "Testemonial was successfully created."
      end

      it "assigns a newly created testemonial as @testemonial" do
        post :create, params: {testemonial: valid_attributes}, session: valid_session
        expect(assigns(:testemonial)).to be_a(Testemonial)
        expect(assigns(:testemonial)).to be_persisted
      end

      it "redirects to the created testemonial" do
        post :create, params: {testemonial: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Testemonial.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved testemonial as @testemonial" do
        post :create, params: {testemonial: invalid_attributes}, session: valid_session
        expect(assigns(:testemonial)).to be_a_new(Testemonial)
      end

      it "re-renders the 'new' template" do
        post :create, params: {testemonial: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:testemonial, title: "New Testemonial",
                                                     description: Faker::Lorem.paragraph(2))
      }

      it "updates the requested testemonial" do
        put :update, params: {id: testemonial.to_param, testemonial: new_attributes}, session: valid_session
        testemonial.reload
        expect(flash[:success]).to eq "Testemonial was successfully updated."
        new_attributes.each_pair do |key, value|
          expect(testemonial[key]).to eq new_attributes[key]
        end
      end

      it "assigns the requested testemonial as @testemonial" do
        put :update, params: {id: testemonial.to_param, testemonial: valid_attributes}, session: valid_session
        expect(assigns(:testemonial)).to eq(testemonial)
      end

      it "redirects to the testemonial" do
        put :update, params: {id: testemonial.to_param, testemonial: valid_attributes}, session: valid_session
        expect(response).to redirect_to(testemonial)
      end
    end

    context "with invalid params" do
      it "assigns the testemonial as @testemonial" do
        put :update, params: {id: testemonial.to_param, testemonial: invalid_attributes}, session: valid_session
        expect(assigns(:testemonial)).to eq(testemonial)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: testemonial.to_param, testemonial: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    before :each do
      testemonial
    end

    it "destroys the requested testemonial" do
      expect {
        delete :destroy, params: {id: testemonial.to_param}, session: valid_session
      }.to change(Testemonial, :count).by(-1)
      expect(flash[:success]).to eq "Testemonial was successfully destroyed."
    end

    it "redirects to the testemonials list" do
      delete :destroy, params: {id: testemonial.to_param}, session: valid_session
      expect(response).to redirect_to(testemonials_url)
    end
  end

end
