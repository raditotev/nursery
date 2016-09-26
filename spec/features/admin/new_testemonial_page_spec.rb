require 'rails_helper'

RSpec.feature "New Testemonial Page", type: :feature do
  before :each do
    sign_in_admin
    visit new_testemonial_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "New Testemonial"
    expect(page).to have_css "#testemonial_name", text: ""
    expect(page).to have_css "#testemonial_description", text: ""
    expect(page).to have_button "Create Testemonial"
    expect(page).to have_css "#back"
  end

  scenario "with correct details" do
    fill_in 'testemonial_name', with: "Harry Potter"
    fill_in 'testemonial_description', with: "Testemonial Content"
    expect { click_button 'Create Testemonial' }.to change(Testemonial, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Testemonial'
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2,  text: "can't be blank"
  end

  scenario "has link Back to Testemonials index page" do
    click_link "Back"
    expect(current_path).to eq admin_testemonials_path
  end
end
