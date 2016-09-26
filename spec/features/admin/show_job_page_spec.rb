require 'rails_helper'

RSpec.feature "Show Job Page", type: :feature do
  before do
    @job = create(:job)
  end

  before :each do
    sign_in_admin
    visit job_path @job
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: @job.title
    expect(page).to have_css "p", text: @job.description
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link  to Edit job page" do
    click_link "Edit"
    expect(current_path).to eq edit_job_path @job
  end

  scenario "Delete button deletes job" do
    click_link "Delete"
    expect(page).to have_content("Job was successfully destroyed.")
    expect(current_path).to eq admin_jobs_path
  end

  scenario "has link Back to job index page" do
    click_link "Back"
    expect(current_path).to eq admin_jobs_path
  end
end
