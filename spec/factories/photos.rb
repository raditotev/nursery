FactoryGirl.define do
  factory :photo do
    image { fixture_file_upload "#{Rails.root}/spec/support/images/test_img.png", 'image/png' }

    factory :album_photo do
      imageable factory: :album
    end
  end
end
