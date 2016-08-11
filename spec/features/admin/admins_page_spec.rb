require 'rails_helper'

RSpec.feature "Admins Page", type: :feature do

  before do
    @admin = create(:admin)
  end

  before :each do
    visit admin_admins_path
    sign_in_super_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Admin"
    expect(page).to have_link "New Admin"
    expect(page).to have_css "h3", text: @admin.username
    expect(page).to have_link @admin.username
    expect(page).to have_css "#pencil"
    expect(page).to have_css "#bin"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Admin" do
    click_link "New Admin"
    expect(current_path).to eq new_admin_path
  end

  scenario "has link to Edit Admin" do
    click_link "Edit"
    expect(current_path).to eq edit_admin_path @admin
  end

  scenario "deletes Admin" do
    click_link "Delete"
    expect(page).to have_content("Admin was successfully destroyed.")
    expect(page).to_not have_content @admin.username
    expect(current_path).to eq admin_admins_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
