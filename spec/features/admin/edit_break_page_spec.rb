require 'rails_helper'

RSpec.feature "Edit Break Page", type: :feature do
  before do
    @break = create(:break)
  end

  before :each do
    visit edit_break_path @break
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_select("break_start_date_3i",
                                                    selected: @break.start_date.strftime("%e"))
    expect(page).to have_select("break_start_date_2i",
                                                    selected: @break.start_date.strftime("%B"))
    expect(page).to have_select("break_start_date_1i",
                                                    selected: @break.start_date.strftime("%Y"))
    expect(page).to have_select("break_end_date_3i",
                                                    selected: @break.end_date.strftime("%e"))
    expect(page).to have_select("break_end_date_2i",
                                                    selected: @break.end_date.strftime("%B"))
    expect(page).to have_select("break_end_date_1i",
                                                    selected: @break.end_date.strftime("%Y"))
    expect(page).to have_css "textarea#break_description", text: @break.description
    expect(page).to have_button "Update Break"
    expect(page).to have_link "Back"
  end

  scenario "with correct details" do
    select '11', from: 'break[start_date(3i)]'
    select 'September', from: 'break[start_date(2i)]'
    select '2016', from: 'break[start_date(1i)]'
    select '11', from: 'break[end_date(3i)]'
    select 'October', from: 'break[end_date(2i)]'
    select '2016', from: 'break[end_date(1i)]'
    fill_in 'break_description', with: "Break times description"
    click_button "Update Break"
    expect(page).to have_content "Break was successfully updated."
  end

  scenario "with incorrect details" do
    fill_in 'break_description', with: ""
    click_button 'Update Break'
    expect(page).to have_css ".has-error", count: 1
  end

  scenario "has link Back to breaks index page" do
    click_link "Back"
    expect(current_path).to eq admin_breaks_path
  end
end
