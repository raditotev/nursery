require 'rails_helper'

RSpec.feature "Edit Admin Page", type: :feature do
  before do
    @admin = create(:admin)
  end

  before :each do
    visit edit_admin_path @admin
    sign_in_super_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "Editing Admin"
    expect(page).to have_css "input#admin_username[value='#{@admin.username}']"
    expect(page).to have_css "input#admin_email[value='#{@admin.email}']"
    expect(page).to have_button "Update Admin"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    fill_in 'admin_username', with: "adminuser"
    fill_in 'admin_email', with: "newadmin@mail.com"
    click_button "Update Admin"
    expect(page).to have_content "Admin was successfully updated."
  end

  scenario "with incorrect details" do
    fill_in 'admin_username', with: ""
    fill_in 'admin_email', with: ""
    click_button "Update Admin"
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2, text: "can't be blank"
  end

  scenario "has link Back to Admins index page" do
    click_link "Back"
    expect(current_path).to eq admin_admins_path
  end
end
