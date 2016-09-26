require 'rails_helper'

RSpec.feature "Show Award Page", type: :feature do
  before do
    @award = create(:award)
  end

  before :each do
    sign_in_admin
    visit award_path @award
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: @award.title
    expect(page).to have_css "p", text: @award.description
    expect(page).to have_css "img[src='#{@award.photo.url}']"
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link Back to Awards index page" do
    click_link "Back"
    expect(current_path).to eq admin_awards_path
  end

  scenario "Delete button deletes Award" do
    click_link "Delete"
    expect(page).to have_content("Award was successfully destroyed.")
    expect(current_path).to eq admin_awards_path
  end
end
