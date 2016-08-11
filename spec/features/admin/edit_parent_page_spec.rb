require 'rails_helper'

RSpec.feature "Edit Parent Page", type: :feature do
  before do
    @parent = create(:parent)
  end

  before :each do
    visit edit_parent_path @parent
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "Editing Parent"
    expect(page).to have_css "input#parent_title[value='#{@parent.title}']"
    expect(page).to have_css "input#parent_first_name[value='#{@parent.first_name}']"
    expect(page).to have_css "input#parent_last_name[value='#{@parent.last_name}']"
    expect(page).to have_css "input#parent_email[value='#{@parent.email}']"
    expect(page).to have_button "Update Parent"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    fill_in 'parent_title', with: "Mr."
    fill_in 'parent_first_name', with: "John"
    fill_in 'parent_last_name', with: "Doe"
    fill_in 'parent_email', with: "john@mail.com"
    click_button "Update Parent"
    expect(page).to have_content "Parent was successfully updated."
  end

  scenario "with incorrect details" do
    fill_in 'parent_title', with: ""
    fill_in 'parent_first_name', with: ""
    fill_in 'parent_last_name', with: ""
    fill_in 'parent_email', with: ""
    click_button "Update Parent"
    expect(page).to have_css ".has-error", count: 4
    expect(page).to have_css "span", count: 4, text: "can't be blank"
  end

  scenario "has link Back to Parents index page" do
    click_link "Back"
    expect(current_path).to eq admin_parents_path
  end
end
