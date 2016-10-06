require 'rails_helper'

RSpec.feature "Edit Event Page", type: :feature do
  before do
    @event = create(:event)
  end

  before :each do
    sign_in_admin
    visit edit_event_path @event
  end

  scenario "visit" do
    expect(page).to have_select("event_start_date_3i",
                                                    selected: @event.start_date.strftime("%e").strip)
    expect(page).to have_select("event_start_date_2i",
                                                    selected: @event.start_date.strftime("%B").strip)
    expect(page).to have_select("event_start_date_1i",
                                                    selected: @event.start_date.strftime("%Y").strip)
    expect(page).to have_select("event_end_date_3i",
                                                    selected: @event.end_date.strftime("%e").strip)
    expect(page).to have_select("event_end_date_2i",
                                                    selected: @event.end_date.strftime("%B").strip)
    expect(page).to have_select("event_end_date_1i",
                                                    selected: @event.end_date.strftime("%Y").strip)
    expect(page).to have_css "textarea#event_description", text: @event.description
    expect(page).to have_button "Update Event"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    select '11', from: 'event[start_date(3i)]'
    select 'September', from: 'event[start_date(2i)]'
    select '2016', from: 'event[start_date(1i)]'
    select '11', from: 'event[end_date(3i)]'
    select 'October', from: 'event[end_date(2i)]'
    select '2016', from: 'event[end_date(1i)]'
    fill_in 'event_description', with: "Event times description"
    click_button "Update Event"
    expect(page).to have_content "Event was successfully updated."
  end

  scenario "with incorrect details" do
    fill_in 'event_description', with: ""
    click_button 'Update Event'
    expect(page).to have_css ".has-error", count: 1
  end

  scenario "has link Back to events index page" do
    click_link "Back"
    expect(current_path).to eq admin_events_path
  end
end
