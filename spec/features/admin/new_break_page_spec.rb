require 'rails_helper'

RSpec.feature "New Break Page", type: :feature do
  before :each do
    visit new_break_path
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "select#break_start_date_3i"
    expect(page).to have_css "select#break_start_date_2i"
    expect(page).to have_css "select#break_start_date_1i"
    expect(page).to have_css "select#break_end_date_3i"
    expect(page).to have_css "select#break_end_date_2i"
    expect(page).to have_css "select#break_end_date_1i"
    expect(page).to have_css "textarea#break_description"
    expect(page).to have_button "Create Break"
  end

  scenario "with correct details" do
    select '11', from: 'break[start_date(3i)]'
    select 'September', from: 'break[start_date(2i)]'
    select '2016', from: 'break[start_date(1i)]'
    select '11', from: 'break[end_date(3i)]'
    select 'October', from: 'break[end_date(2i)]'
    select '2016', from: 'break[end_date(1i)]'
    fill_in 'break_description', with: "Break times description"
    expect { click_button 'Create Break' }.to change(Break, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Break'
    expect(page).to have_css ".has-error", count: 1
  end

  scenario "has link Back to breaks index page" do
    click_link "Back"
    expect(current_path).to eq admin_breaks_path
  end
end
