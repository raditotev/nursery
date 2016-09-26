require 'rails_helper'

RSpec.feature "New newsletter Page", type: :feature do
  before :each do
    sign_in_admin
    visit new_newsletter_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "New Newsletter"
    expect(page).to have_css "#newsletter_name", text: ""
    expect(page).to have_css "#newsletter_document"
    expect(page).to have_button "Create Newsletter"
    expect(page).to have_css "#back"
  end

  scenario "with correct details" do
    fill_in 'newsletter_name', with: "Newsletter Title"
    attach_file('File', "#{Rails.root}/spec/support/documents/test.pdf")
    expect { click_button 'Create Newsletter' }.to change(Newsletter, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Newsletter'
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2, text: "can't be blank"
  end

  scenario "has link Back to newsletters index page" do
    click_link "Back"
    expect(current_path).to eq admin_newsletters_path
  end
end
