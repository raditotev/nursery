require 'rails_helper'

RSpec.feature "New Event Page", type: :feature do
  before :each do
    sign_in_admin
    visit new_event_path
  end

  scenario "visit" do
    expect(page).to have_css "select#event_start_date_3i"
    expect(page).to have_css "select#event_start_date_2i"
    expect(page).to have_css "select#event_start_date_1i"
    expect(page).to have_css "select#event_end_date_3i"
    expect(page).to have_css "select#event_end_date_2i"
    expect(page).to have_css "select#event_end_date_1i"
    expect(page).to have_css "textarea#event_description"
    expect(page).to have_button "Create Event"
  end

  scenario "with correct details" do
    select '11', from: 'event[start_date(3i)]'
    select 'September', from: 'event[start_date(2i)]'
    select '2016', from: 'event[start_date(1i)]'
    select '11', from: 'event[end_date(3i)]'
    select 'October', from: 'event[end_date(2i)]'
    select '2016', from: 'event[end_date(1i)]'
    fill_in 'event_description', with: "Event times description"
    expect { click_button 'Create Event' }.to change(Event, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Event'
    expect(page).to have_css ".has-error", count: 1
  end

  scenario "has link Back to events index page" do
    click_link "Back"
    expect(current_path).to eq admin_events_path
  end
end
