require 'rails_helper'

RSpec.feature "Show Event Page", type: :feature do
  before do
    @event = create(:event)
  end

  before :each do
    sign_in_admin
    visit event_path @event
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: event_text(@event)
    expect(page).to have_css "p", text: @event.description
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link Back to events index page" do
    click_link "Back"
    expect(current_path).to eq admin_events_path
  end

  scenario "Delete button deletes event" do
    click_link "Delete"
    expect(page).to have_content("Event was successfully destroyed.")
    expect(current_path).to eq admin_events_path
  end
end
