module ControllerHelperMethods
  def login_super_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:super_admin]
      @super_admin = FactoryGirl.create(:super_admin)
      sign_in @super_admin
    end
  end

  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end
  end

  def login_parent
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:parent]
      sign_in FactoryGirl.create(:parent)
    end
  end

  def create_object resource
    let(:object){ create(resource) }
  end

  def unauthorized_user_is_redirected resource
    describe "unauthorized user" do
      create_object resource
      let(:valid_attributes) { attributes_for(resource) }
      let(:valid_session) { {} }

      it "is redirected to sign in page on get index" do
        get :index
        expect(response).to redirect_to new_admin_session_path
      end

      it "is redirected to sign in page on get show" do
        get :show, params: { id: object.id }, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end

      it "is redirected to sign in page on get new" do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end

      it "is redirected to sign in page on get edit" do
        get :edit, params: { id: object.id }, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end

      it "is redirected to sign in page on post create" do
        post :create, params: {resource => valid_attributes}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end

      it "is redirected to sign in page on put update" do
        post :create, params: {resource => valid_attributes}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end

      it "is redirected to sign in page on delete destroy" do
        post :create, params: {resource => valid_attributes}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  def it_loads_index_page
    it "loads index page" do
      get :index
      expect(response).to be_success
      expect(response).to render_template :index
    end
  end

  def it_loads_show_page resource
    create_object resource

    it "loads show page" do
      get :show, params: { id: object.to_param }, session: {}
      expect(response).to be_success
      expect(response).to render_template :show
    end
  end

def it_loads_edit_page resource
  create_object resource

  it "loads edit page" do
      get :edit, params: { id: object.to_param }, session: valid_session
      expect(response).to be_success
      expect(response).to render_template :edit
    end
end

end
