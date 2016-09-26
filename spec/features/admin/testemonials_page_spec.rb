require 'rails_helper'

RSpec.feature "Testemonials Page", type: :feature do

  before do
    @testemonial = create(:testemonial)
  end

  before :each do
    sign_in_admin
    visit admin_testemonials_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Testemonial"
    expect(page).to have_link "New Testemonial"
    expect(page).to have_css "h3", text: @testemonial.name
    expect(page).to have_link @testemonial.name
    expect(page).to have_css "#pencil"
    expect(page).to have_css "#bin"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to Dashboard" do
    click_link "Admin Panel"
    expect(current_path).to eq admin_dashboard_path
  end

  scenario "has link to create New Testemonial" do
    click_link "New Testemonial"
    expect(current_path).to eq new_testemonial_path
  end

  scenario "has link to Edit Testemonial" do
    click_link "Edit"
    expect(current_path).to eq edit_testemonial_path @testemonial
  end

  scenario "deletes Testemonial" do
    click_link "Delete"
    expect(page).to have_content("Testemonial was successfully destroyed.")
    expect(page).to_not have_content @testemonial.name
    expect(current_path).to eq admin_testemonials_path
  end

  scenario "has link Back to Dashboard" do
    click_link "Back"
    expect(current_path).to eq admin_dashboard_path
  end
end
