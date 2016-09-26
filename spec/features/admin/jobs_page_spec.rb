require 'rails_helper'

RSpec.feature "Jobs Page", type: :feature do

  before do
    @job = create(:job)
  end

  before :each do
    sign_in_admin
    visit admin_jobs_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Job"
    expect(page).to have_link "New Job"
    expect(page).to have_css "h3", text: @job.title
    expect(page).to have_link @job.title
    expect(page).to have_css "#pencil"
    expect(page).to have_css "#bin"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Job" do
    click_link "New Job"
    expect(current_path).to eq new_job_path
  end

  scenario "has link to Edit Job" do
    click_link "Edit"
    expect(current_path).to eq edit_job_path @job
  end

  scenario "deletes Job" do
    click_link "Delete"
    expect(page).to have_content("Job was successfully destroyed.")
    expect(page).to_not have_content @job.title
    expect(current_path).to eq admin_jobs_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
