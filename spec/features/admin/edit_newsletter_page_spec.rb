require 'rails_helper'

RSpec.feature "Edit Newsletter Page", type: :feature do
  before do
    @newsletter = create(:newsletter)
  end

  before :each do
    sign_in_admin
    visit edit_newsletter_path @newsletter
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "Editing Newsletter"
    expect(page).to have_css "input#newsletter_name[value='#{@newsletter.name}']"
    expect(page).to have_css "#newsletter_document"
    expect(page).to have_button "Update Newsletter"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    fill_in 'newsletter_name', with: "New Newsletter Name"
    click_button "Update Newsletter"
    expect(page).to have_content "Newsletter was successfully updated."
  end

  scenario "with incorrect details" do
    fill_in 'newsletter_name', with: ""
    click_button "Update Newsletter"
    expect(page).to have_css ".has-error", count: 1
    expect(page).to have_css "span", count: 1, text: "can't be blank"
  end

  scenario "has link Back to Newsletters index page" do
    click_link "Back"
    expect(current_path).to eq admin_newsletters_path
  end
end
