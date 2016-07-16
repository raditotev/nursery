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
end
