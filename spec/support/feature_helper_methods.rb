module FeatureHelperMethods
  include ActionView::Helpers::AdminsHelper

  def sign_in_admin
    admin = create(:admin)
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
  end

  def sign_in_super_admin
    admin = create(:super_admin)
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
  end

  def create_album_with_photo
    visit new_album_path
    fill_in 'album_name', with: "Test Album with Photo"
    page.attach_file "images_", ["#{Rails.root}/spec/support/images/test_img.png"]
    click_button 'Create Album'
  end
end
