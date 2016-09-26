require 'rails_helper'

RSpec.feature "Awards Page", type: :feature do

  before do
    @award = create(:award)
  end

  before :each do
    sign_in_admin
    visit admin_awards_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Award"
    expect(page).to have_link "New Award"
    expect(page).to have_css "h3", text: @award.title
    expect(page).to have_link @award.title
    expect(page).to have_css "#pencil"
    expect(page).to have_css "#bin"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Award" do
    click_link "New Award"
    expect(current_path).to eq new_award_path
  end

  scenario "has link to create Edit Award" do
    click_link "Edit"
    expect(current_path).to eq edit_award_path @award
  end

  scenario "deletes Award" do
    click_link "Delete"
    expect(page).to have_content("Award was successfully destroyed.")
    expect(page).to_not have_content @award.title
    expect(current_path).to eq admin_awards_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
