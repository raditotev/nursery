require 'rails_helper'

RSpec.feature "Dashboard", type: :feature do

  before :each do
    sign_in_admin
  end

  subject { page }

  it { is_expected.to have_title "Admin | Nursery" }
  it { is_expected.to have_css "h1", text: "Admin Panel" }
  it { is_expected.to have_css "h1", text: "Awards" }
  it { is_expected.to have_link "Awards" }
  it { is_expected.to have_css "h1", text: "Events" }
  it { is_expected.to have_link "Events" }
  it { is_expected.to have_css "h1", text: "FAQs" }
  it { is_expected.to have_link "FAQs" }
  it { is_expected.to have_css "h1", text: "Gallery" }
  it { is_expected.to have_link "Gallery" }
  it { is_expected.to have_css "h1", text: "Jobs" }
  it { is_expected.to have_link "Jobs" }
  it { is_expected.to have_css "h1", text: "Newsletters" }
  it { is_expected.to have_link "Newsletters" }
  it { is_expected.to have_css "h1", text: "Parents" }
  it { is_expected.to have_link "Parents" }
  it { is_expected.to have_css "h1", text: "Testemonials" }
  it { is_expected.to have_link "Testemonials" }
  it { is_expected.not_to have_css "h1", text: "Admins" }
  it { is_expected.not_to have_link "Admins" }

  scenario "has link to Awards" do
    click_link "Awards"
    expect(current_path).to eq admin_awards_path
  end

  scenario "has link to Events" do
    click_link "Events"
    expect(current_path).to eq admin_events_path
  end

  scenario "has link to FAQs" do
    click_link "FAQs"
    expect(current_path).to eq admin_faqs_path
  end

  scenario "has link to FAQs" do
    click_link "Gallery"
    expect(current_path).to eq admin_albums_path
  end

  scenario "has link to Jobs" do
    click_link "Jobs"
    expect(current_path).to eq admin_jobs_path
  end

  scenario "has link to Newsletters" do
    click_link "Newsletters"
    expect(current_path).to eq admin_newsletters_path
  end

  scenario "has link to Parents" do
    click_link "Parents"
    expect(current_path).to eq admin_parents_path
  end

  scenario "has link to Testemonials" do
    click_link "Testemonials"
    expect(current_path).to eq admin_testemonials_path
  end
end
