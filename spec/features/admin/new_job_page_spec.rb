require 'rails_helper'

RSpec.feature "New Job Page", type: :feature do
  before :each do
    sign_in_admin
    visit new_job_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: "New Job"
    expect(page).to have_css "#job_title", text: ""
    expect(page).to have_css "#job_description", text: ""
    expect(page).to have_button "Create Job"
    expect(page).to have_css "#back"
  end

  scenario "with correct details" do
    fill_in 'job_title', with: "Job Title"
    fill_in 'job_description', with: "Job Description"
    expect { click_button 'Create Job' }.to change(Job, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Job'
    expect(page).to have_css ".has-error", count: 2
    expect(page).to have_css "span", count: 2
    expect(page).to have_css "span", text: "can't be blank"
  end

  scenario "has link Back to jobs index page" do
    click_link "Back"
    expect(current_path).to eq admin_jobs_path
  end
end
