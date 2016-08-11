require 'rails_helper'

RSpec.feature "New Parent Page", type: :feature do
  before :each do
    visit new_parent_path
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "New Parent"
    expect(page).to have_css "#parent_title", text: ""
    expect(page).to have_css "#parent_first_name", text: ""
    expect(page).to have_css "#parent_last_name", text: ""
    expect(page).to have_css "#parent_email", text: ""
    expect(page).to have_button "Create Parent"
    expect(page).to have_css "#back"
  end

  scenario "with correct details" do
    fill_in 'parent_title', with: "Mr."
    fill_in 'parent_first_name', with: "John"
    fill_in 'parent_last_name', with: "Doe"
    fill_in 'parent_email', with: "john@mail.com"
    expect { click_button 'Create Parent' }.to change(Parent, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Parent'
    expect(page).to have_css ".has-error", count: 4
    expect(page).to have_css "span", count: 4,  text: "can't be blank"
  end

  scenario "has link Back to parents index page" do
    click_link "Back"
    expect(current_path).to eq admin_parents_path
  end
end
