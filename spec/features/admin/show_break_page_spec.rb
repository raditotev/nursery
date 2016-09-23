require 'rails_helper'

RSpec.feature "Show Break Page", type: :feature do
  before do
    @break = create(:break)
  end

  before :each do
    visit break_path @break
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: break_text(@break)
    expect(page).to have_css "p", text: @break.description
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link Back to breaks index page" do
    click_link "Back"
    expect(current_path).to eq admin_breaks_path
  end

  scenario "Delete button deletes break" do
    click_link "Delete"
    expect(page).to have_content("Break was successfully destroyed.")
    expect(current_path).to eq admin_breaks_path
  end
end
