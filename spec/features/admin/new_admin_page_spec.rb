require 'rails_helper'

RSpec.feature "New Admin Page", type: :feature do
  before :each do
    sign_in_super_admin
    visit new_admin_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "New Admin"
    expect(page).to have_css "#admin_username", text: ""
    expect(page).to have_css "#admin_email", text: ""
    expect(page).to have_button "Create Admin"
    expect(page).to have_css "#back"
  end

  scenario "with correct details" do
    fill_in 'admin_username', with: "newadmin"
    fill_in 'admin_email', with: "admin@mail.com"
    expect { click_button 'Create Admin' }.to change(Admin, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Admin'
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2,  text: "can't be blank"
  end

  scenario "has link Back to Admins index page" do
    click_link "Back"
    expect(current_path).to eq admin_admins_path
  end
end
