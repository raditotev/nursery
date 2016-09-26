require 'rails_helper'

RSpec.feature "Show Parent Page", type: :feature do
  before do
    @parent = create(:parent)
  end

  before :each do
    sign_in_admin
    visit parent_path @parent
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1", text: parent_full_name(@parent)
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link  to Edit Parent page" do
    click_link "Edit"
    expect(current_path).to eq edit_parent_path @parent
  end

  scenario "Delete button deletes Parent" do
    click_link "Delete"
    expect(page).to have_content("Parent was successfully destroyed.")
    expect(current_path).to eq admin_parents_path
  end

  scenario "has link Back to Parent index page" do
    click_link "Back"
    expect(current_path).to eq admin_parents_path
  end
end
