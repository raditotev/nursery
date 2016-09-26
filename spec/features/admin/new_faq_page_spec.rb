require 'rails_helper'

RSpec.feature "New FAQ Page", type: :feature do
  before :each do
    sign_in_admin
    visit new_faq_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "New Faq"
    expect(page).to have_css "#faq_question", text: ""
    expect(page).to have_css "#faq_answer", text: ""
    expect(page).to have_button "Create Faq"
    expect(page).to have_css "#back"
  end

  scenario "with correct details" do
    fill_in 'faq_question', with: "Test Question"
    fill_in 'faq_answer', with: "Test Answert"
    expect { click_button 'Create Faq' }.to change(Faq, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Faq'
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2
    expect(page).to have_css "span", text: "can't be blank"
  end

  scenario "has link Back to faqs index page" do
    click_link "Back"
    expect(current_path).to eq admin_faqs_path
  end
end
