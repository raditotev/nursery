require 'rails_helper'

RSpec.feature "FAQs Page", type: :feature do

  before do
    @faq = create(:faq)
  end

  before :each do
    visit admin_faqs_path
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Faq"
    expect(page).to have_link "New Faq"
    expect(page).to have_css "h3", text: @faq.question
    expect(page).to have_link @faq.question
    expect(page).to have_css "#pencil"
    expect(page).to have_css "#bin"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New faq" do
    click_link "New Faq"
    expect(current_path).to eq new_faq_path
  end

  scenario "has link to Edit faq" do
    click_link "Edit"
    expect(current_path).to eq edit_faq_path @faq
  end

  scenario "deletes FAQ" do
    click_link "Delete"
    expect(page).to have_content("FAQ was successfully destroyed.")
    expect(page).to_not have_content @faq.question
    expect(current_path).to eq admin_faqs_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
