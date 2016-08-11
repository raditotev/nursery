require 'rails_helper'

RSpec.feature "Edit FAQ Page", type: :feature do
  before do
    @faq = create(:faq)
  end

  before :each do
    visit edit_faq_path @faq
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "Editing Faq"
    expect(page).to have_css "#faq_question", text: @faq.question
    expect(page).to have_css "#faq_answer", text: @faq.answer
    expect(page).to have_button "Update Faq"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    fill_in 'faq_question', with: "Test Question"
    fill_in 'faq_answer', with: "Test Answer"
    click_button "Update Faq"
    expect(page).to have_content "FAQ was successfully updated."
  end

  scenario "with incorrect details" do
   fill_in 'faq_question', with: ""
    fill_in 'faq_answer', with: ""
    click_button "Update Faq"
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2
    expect(page).to have_css "span", text: "can't be blank"
  end

  scenario "has link Back to faqs index page" do
    click_link "Back"
    expect(current_path).to eq admin_faqs_path
  end
end
