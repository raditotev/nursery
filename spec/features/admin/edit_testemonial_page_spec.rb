require 'rails_helper'

RSpec.feature "Edit Testemonial Page", type: :feature do
  before do
    @testemonial = create(:testemonial)
  end

  before :each do
    visit edit_testemonial_path @testemonial
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "Editing Testemonial"
    expect(page).to have_css "input#testemonial_title[value='#{@testemonial.title}']"
    expect(page).to have_css "#testemonial_description", text: @testemonial.description
    expect(page).to have_button "Update Testemonial"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    fill_in 'testemonial_title', with: "New Testemonial Title"
    fill_in 'testemonial_description', with: "New testemonial content"
    click_button "Update Testemonial"
    expect(page).to have_content "Testemonial was successfully updated."
  end

  scenario "with incorrect details" do
    fill_in 'testemonial_title', with: ""
    fill_in 'testemonial_description', with: ""
    click_button "Update Testemonial"
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2, text: "can't be blank"
  end

  scenario "has link Back to Testemonials index page" do
    click_link "Back"
    expect(current_path).to eq admin_testemonials_path
  end
end
