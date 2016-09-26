require 'rails_helper'

RSpec.feature "Show Admin Page", type: :feature do
  before do
    @admin = create(:admin)
  end

  before :each do
    sign_in_super_admin
    visit admin_path @admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "p", text: @admin.username
    expect(page).to have_css "p", text: @admin.email
    expect(page).to have_css "p", text: @admin.generated_password
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link  to Edit Admin page" do
    click_link "Edit"
    expect(current_path).to eq edit_admin_path @admin
  end

  scenario "Delete button deletes Admin" do
    click_link "Delete"
    expect(page).to have_content("Admin was successfully destroyed.")
    expect(current_path).to eq admin_admins_path
  end

  scenario "has link Back to admin index page" do
    click_link "Back"
    expect(current_path).to eq admin_admins_path
  end
end
