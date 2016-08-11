module FeatureHelperMethods
  include ActionView::Helpers::AdminsHelper

  def sign_in_admin
    admin = create(:admin)
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
  end

  def sign_in_super_admin
    admin = create(:super_admin)
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
  end
end
