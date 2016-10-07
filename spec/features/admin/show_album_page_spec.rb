require 'rails_helper'

RSpec.feature "Show Album Page", type: :feature do

  before :each do
    sign_in_admin
    create_album_with_photo
    @album = Album.first
    visit album_path @album
  end

  scenario "visit" do
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_link "Admin Panel"
    expect(page).to have_css "h1.text-center", text: @album.name
    expect(page.find('img')['src']).to have_content 'test_img.png'
    expect(page).to have_css "img", count: 1
    expect(page).to have_css "#back"
    expect(page).to have_link "Back"
  end

  scenario "has link Back to Gallery page" do
    click_link "Back"
    expect(current_path).to eq admin_albums_path
  end
end


