module FeatureHelperMethods
  def sign_in_admin
    admin = create(:admin)
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
  end
end
