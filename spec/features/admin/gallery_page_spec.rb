require 'rails_helper'

RSpec.feature "Gallery Page", type: :feature do

  before do
    sign_in_admin
    @album_without_photo = FactoryGirl.create(:album)
    create_album_with_photo
    @album_with_photo = Album.first
  end

  before :each do
    visit admin_albums_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "#plus"
    expect(page).to have_css "h3", text: "New Album"
    expect(page).to have_link "New Album"
    expect(page).to have_css "h3", text: @album_without_photo.name
    expect(page).to have_css ".missing-photos", count: 1
    expect(page).to have_css "h3", text: @album_with_photo.name
    expect(page).to have_css "img", count: 1
    expect(page).to have_link "Edit", count: 2
    expect(page).to have_link "Delete", count: 2
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link to create Album" do
    click_link "New Album"
    expect(current_path).to eq new_album_path
  end

  scenario "has link to show Album" do
    first(".thumbnail a").click
    expect(current_path).to eq album_path @album_with_photo
  end

  scenario "has link to edit Album" do
    first(".thumbnail").click_link("Edit")
    expect(current_path).to eq edit_album_path @album_with_photo
  end

  scenario "has link to delete Album" do
    first(".thumbnail").click_link("Delete")
    expect(page).to have_content("Album was successfully destroyed.")
    expect(page).to_not have_content @album_with_photo.name
    expect(current_path).to eq admin_albums_path
  end
end
