require 'rails_helper'

RSpec.feature "Edit Award Page", type: :feature do
  before do
    @award = create(:award)
  end

  before :each do
    visit edit_award_path @award
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Editing Award"
    expect(page).to have_selector "input#award_title[value='#{@award.title}']"
    expect(page).to have_css "textarea", text: @award.description
    expect(page).to have_css "#award_photo"
    expect(page).to have_button "Update Award"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    fill_in 'award_title', with: "Test Award"
    fill_in 'award_description', with: "Award Content"
    click_button "Update Award"
    expect(page).to have_content "Award was successfully updated."
  end

  scenario "with incorrect details" do
    fill_in 'award_title', with: ""
    fill_in 'award_description', with: ""
    click_button "Update Award"
    expect(page).to have_css ".has-error"
    expect(page).to have_css "span", text: "can't be blank"
  end

  scenario "has link Back to Awards index page" do
    click_link "Back"
    expect(current_path).to eq admin_awards_path
  end
end
