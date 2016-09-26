require 'rails_helper'

RSpec.feature "Newsletters Page", type: :feature do

  before do
    @newsletter = create(:newsletter)
  end

  before :each do
    sign_in_admin
    visit admin_newsletters_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Newsletter"
    expect(page).to have_link "New Newsletter"
    expect(page).to have_css "h3", text: @newsletter.name
    expect(page).to have_link @newsletter.name
    expect(page).to have_css "#pencil"
    expect(page).to have_css "#bin"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Newsletter" do
    click_link "New Newsletter"
    expect(current_path).to eq new_newsletter_path
  end

  scenario "has link to Edit Newsletter" do
    click_link "Edit"
    expect(current_path).to eq edit_newsletter_path @newsletter
  end

  scenario "deletes Newsletter" do
    click_link "Delete"
    expect(page).to have_content("Newsletter was successfully destroyed.")
    expect(page).to_not have_content @newsletter.name
    expect(current_path).to eq admin_newsletters_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
