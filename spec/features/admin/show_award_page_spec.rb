require 'rails_helper'

RSpec.feature "Admin::ShowAwardPage", type: :feature do
  before do
    @award = create(:award)
  end

  before :each do
    visit award_path @award
    sign_in_admin
  end

  subject { page }

  it { is_expected.to have_css "h1", text: "Admin Panel" }
  it { is_expected.to have_link "Admin Panel" }
  it { is_expected.to have_css "h1", @award.title }
  it { is_expected.to have_css "p", @award.description }
  it { is_expected.to have_css "img[src='#{@award.photo.url}']" }
  it { is_expected.to have_link "Edit" }
  it { is_expected.to have_link "Delete" }
  it { is_expected.to have_link "Back" }

  scenario "has link Back to Awards index page" do
    click_link "Back"
    expect(current_path).to eq admin_awards_path
  end
end
