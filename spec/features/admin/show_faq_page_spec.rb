require 'rails_helper'

RSpec.feature "Show FAQ Page", type: :feature do
  before do
    @faq = create(:faq)
  end

  before :each do
    visit faq_path @faq
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "Question:"
    expect(page).to have_css "h3", text: @faq.question
    expect(page).to have_css "h1", text: "Answer:"
    expect(page).to have_css "h3", text: @faq.answer
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link  to Edit FAQ page" do
    click_link "Edit"
    expect(current_path).to eq edit_faq_path @faq
  end

  scenario "Delete button deletes FAQ" do
    click_link "Delete"
    expect(page).to have_content("FAQ was successfully destroyed.")
    expect(current_path).to eq admin_faqs_path
  end

  scenario "has link Back to FAQ index page" do
    click_link "Back"
    expect(current_path).to eq admin_faqs_path
  end
end
