require 'rails_helper'

RSpec.feature "Breaks Page", type: :feature do

  before do
    @break = create(:break)
  end

  before :each do
    visit admin_breaks_path
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Break"
    expect(page).to have_link "New Break"
    expect(page).to have_css "h3", text: break_text(@break)
    expect(page).to have_link break_text(@break)
    expect(page).to have_css "#pencil"
    expect(page).to have_link "Edit"
    expect(page).to have_css "#bin"
    expect(page).to have_link "Edit"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Break" do
    click_link "New Break"
    expect(current_path).to eq new_break_path
  end

  scenario "has link to create Edit Break" do
    click_link "Edit"
    expect(current_path).to eq edit_break_path @break
  end

  scenario "deletes Break" do
    click_link "Delete"
    expect(page).to have_content("Break was successfully destroyed.")
    expect(page).to_not have_content break_text(@break)
    expect(current_path).to eq admin_breaks_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
