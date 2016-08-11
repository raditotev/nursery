require 'rails_helper'

RSpec.feature "Show newsletter Page", type: :feature do
  before do
    @newsletter = create(:newsletter)
  end

  before :each do
    visit newsletter_path @newsletter
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: @newsletter.name
    expect(page).to have_link "Open", href: @newsletter.document.url
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link  to Edit Newsletter page" do
    click_link "Edit"
    expect(current_path).to eq edit_newsletter_path @newsletter
  end

  scenario "Delete button deletes Newsletter" do
    click_link "Delete"
    expect(page).to have_content("Newsletter was successfully destroyed.")
    expect(current_path).to eq admin_newsletters_path
  end

  scenario "has link Back to Newsletter index page" do
    click_link "Back"
    expect(current_path).to eq admin_newsletters_path
  end
end
