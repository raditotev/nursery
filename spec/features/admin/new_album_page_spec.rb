require 'rails_helper'

RSpec.feature "New Album Page", type: :feature do

  before :each do
    sign_in_admin
    visit new_album_path
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1.text-center", text: "New Album"
    expect(page).to have_css "label", text: "Name"
    expect(page).to have_css "input#album_name"
    expect(page).to have_css "div#image-preview"
    expect(page).to have_css "label", text: "Choose photos"
    expect(page).to have_css "input#images_"
    expect(page).to have_button "Create Album"
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "single image upload" do
    fill_in 'album_name', with: "New Test Album"
    page.attach_file "images_", ["#{Rails.root}/spec/support/images/test_img.png"]
    expect { click_button 'Create Album' }.to change(Album, :count).by(1)
    expect(current_path).to eq album_path Album.first
  end

  scenario "multiple image upload" do
    fill_in 'album_name', with: "New Test Album"
    image1 = "#{Rails.root}/spec/support/images/test_img.png"
    image2 = "#{Rails.root}/spec/support/images/test_img1.png"
    page.attach_file "images_", [image1, image2]
    expect { click_button 'Create Album' }.to change(Album, :count).by(1)
    expect(current_path).to eq album_path Album.first
  end

  scenario "with incorect destails" do
    click_button 'Create Album'
    expect(page).to have_css "span", text: "can't be blank"
  end

  scenario "has link Back to Gallery page" do
    click_link "Back"
    expect(current_path).to eq admin_albums_path
  end
end
