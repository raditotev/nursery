require 'rails_helper'

RSpec.feature "Admin::NewAwardPage", type: :feature do
  before :each do
    visit new_award_path
    sign_in_admin
  end

  subject { page }

  it { is_expected.to have_css "h1", text: "Admin Panel" }

  scenario "with correct details" do
    fill_in 'award_title', with: "Test Award"
    fill_in 'award_description', with: "Award content"
    attach_file('Photo', "#{Rails.root}/spec/support/images/test_img.png")
    expect { click_button 'Create Award' }.to change(Award, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Award'
    expect(page).to have_css "span", text: "can't be blank"
  end

  scenario "has link Back to Awards index page" do
    click_link "Back"
    expect(current_path).to eq admin_awards_path
  end
end
