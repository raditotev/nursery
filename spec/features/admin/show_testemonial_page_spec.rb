require 'rails_helper'

RSpec.feature "Show Testemonial Page", type: :feature do
  before do
    @testemonial = create(:testemonial)
  end

  before :each do
    sign_in_admin
    visit testemonial_path @testemonial
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "blockquote", text: @testemonial.description
    expect(page).to have_css "strong", text: @testemonial.name
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Back"
  end

  scenario "has link  to Edit Testemonial page" do
    click_link "Edit"
    expect(current_path).to eq edit_testemonial_path @testemonial
  end

  scenario "Delete button deletes Testemonial" do
    click_link "Delete"
    expect(page).to have_content("Testemonial was successfully destroyed.")
    expect(current_path).to eq admin_testemonials_path
  end

  scenario "has link Back to testemonial index page" do
    click_link "Back"
    expect(current_path).to eq admin_testemonials_path
  end
end
