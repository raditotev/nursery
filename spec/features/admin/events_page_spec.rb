require 'rails_helper'

RSpec.feature "Events Page", type: :feature do

  before do
    @event = create(:event)
  end

  before :each do
    sign_in_admin
    visit admin_events_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Event"
    expect(page).to have_link "New Event"
    expect(page).to have_css "h3", text: event_text(@event)
    expect(page).to have_link event_text(@event)
    expect(page).to have_css "#pencil"
    expect(page).to have_link "Edit"
    expect(page).to have_css "#bin"
    expect(page).to have_link "Edit"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Event" do
    click_link "New Event"
    expect(current_path).to eq new_event_path
  end

  scenario "has link to Edit Event" do
    click_link "Edit"
    expect(current_path).to eq edit_event_path @event
  end

  scenario "deletes Event" do
    click_link "Delete"
    expect(page).to have_content("Event was successfully destroyed.")
    expect(page).to_not have_content event_text(@event)
    expect(current_path).to eq admin_events_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
