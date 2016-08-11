require 'rails_helper'

RSpec.feature "Parents Page", type: :feature do

  before do
    @parent = create(:parent)
  end

  before :each do
    visit admin_parents_path
    sign_in_admin
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Parent"
    expect(page).to have_link "New Parent"
    expect(page).to have_css "h3", text: parent_full_name(@parent)
    expect(page).to have_link parent_full_name(@parent)
    expect(page).to have_css "#pencil"
    expect(page).to have_css "#bin"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Parent" do
    click_link "New Parent"
    expect(current_path).to eq new_parent_path
  end

  scenario "has link to Edit Parent" do
    click_link "Edit"
    expect(current_path).to eq edit_parent_path @parent
  end

  scenario "deletes Parent" do
    click_link "Delete"
    expect(page).to have_content("Parent was successfully destroyed.")
    expect(page).to_not have_content @parent.title
    expect(current_path).to eq admin_parents_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
