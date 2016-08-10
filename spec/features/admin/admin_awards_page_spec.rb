require 'rails_helper'

RSpec.feature "Admin::AwardsPage", type: :feature do

  before do
    @award = create(:award)
  end

  before :each do
    visit admin_awards_path
    sign_in_admin
  end

  subject { page }

  it { is_expected.to have_css "h1", text: "Admin Panel" }
  it { is_expected.to have_link "Admin Panel" }
  it { is_expected.to have_css "#plus" }
  it { is_expected.to have_css "h3", text: "New Award" }
  it { is_expected.to have_link "New Award" }
  it { is_expected.to have_css "h3", text: @award.title }
  it { is_expected.to have_link @award.title }
  it { is_expected.to have_css "#pencil" }
  it { is_expected.to have_css "#bin" }

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

  scenario "deletes Award", js: true do
    click_link "Delete"
    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Are you sure?")
    a.accept
    expect(page).to have_content("Award was successfully destroyed.")
    expect(page).to_not have_content @award.title
    expect(current_path).to eq admin_awards_path
  end
end
