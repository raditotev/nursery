require 'rails_helper'

RSpec.feature "Edit Album Page", type: :feature do

  before :each do
    sign_in_admin
    create_album_with_photo
    @album = Album.first
    visit edit_album_path @album
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1.text-center", text: "Edit Album"
    expect(page).to have_css "label", text: "Name"
    expect(page).to have_css "input#album_name[value='#{@album.name}']"
    expect(page).to have_css "div#photo-#{@album.photos.first.id}"
    expect(page).to have_css "div.image", count: 1
    expect(page).to have_css "a.delete-image"
    expect(page).to have_css "div#image-preview"
    expect(page).to have_css "label", text: "Choose photos"
    expect(page).to have_css "input#images_"
    expect(page).to have_button "Update Album"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "change Album name" do
    fill_in 'album_name', with: "Update Album"
    click_button "Update Album"
    expect(page).to have_content "Album was successfully updated."
    expect(current_path).to eq album_path @album
    expect(page).to have_css "h1", text: Album.first.name
  end

  scenario "add new photo to Album" do
    page.attach_file "images_", ["#{Rails.root}/spec/support/images/test_img1.png"]
    click_button "Update Album"
    expect(page).to have_content "Album was successfully updated."
    expect(current_path).to eq album_path @album
    expect(page).to have_css "img", count: 2
  end

  scenario "change Album cover photo" do
    page.attach_file "images_", ["#{Rails.root}/spec/support/images/test_img1.png"]
    click_button "Update Album"
    visit edit_album_path @album
    first_photo = Album.first.photos[0]
    second_photo = Album.first.photos[1]
    expect(page).to have_css "input#album_cover_photo_id_#{second_photo.id}[checked='checked']"
    page.choose("album_cover_photo_id_#{first_photo.id}")
    click_button "Update Album"
    visit edit_album_path @album
    expect(page).to have_css "input#album_cover_photo_id_#{first_photo.id}[checked='checked']"
  end

  scenario "deletes photos from Album", js: true do
    photo_id = Album.first.photos.first.id
    first("div#photo-#{photo_id} a").click
    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Are you sure?")
    a.accept
    expect(page).not_to have_css "div#photo-#{photo_id}"
    click_button "Update Album"
    expect(page).to have_content "Album was successfully updated."
    expect(page).to have_css "img", count: 0
  end

  scenario "doesn't add duplicate photos to Album" do
    page.attach_file "images_", ["#{Rails.root}/spec/support/images/test_img.png"]
    click_button "Update Album"
    expect(page).to have_content "Album was successfully updated."
    expect(page).to have_css "img", count: 1
  end

  scenario "with incorrect details" do
    fill_in 'album_name', with: ""
    click_button "Update Album"
    expect(page).to have_css ".has-error"
    expect(page).to have_css "span", text: "can't be blank"
  end

  scenario "has link Back to Gallery page" do
    click_link "Back"
    expect(current_path).to eq admin_albums_path
  end
end
