require 'rails_helper'

RSpec.feature "Edit Job Page", type: :feature do
  before do
    @job = create(:job)
  end

  before :each do
    sign_in_admin
    visit edit_job_path @job
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "Editing Job"
    expect(page).to have_css "input#job_title[value='#{@job.title}']"
    expect(page).to have_css "#job_description", text: @job.description
    expect(page).to have_button "Update Job"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    fill_in 'job_title', with: "New Job Title"
    fill_in 'job_description', with: "New Description"
    click_button "Update Job"
    expect(page).to have_content "Job was successfully updated."
  end

  scenario "with incorrect details" do
   fill_in 'job_title', with: ""
    fill_in 'job_description', with: ""
    click_button "Update Job"
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2, text: "can't be blank"
  end

  scenario "has link Back to jobs index page" do
    click_link "Back"
    expect(current_path).to eq admin_jobs_path
  end
end
