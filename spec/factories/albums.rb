FactoryGirl.define do
  factory :album do
    name "Album Name"

    factory :album_with_photo do
      after(:create) do |album|
        create(:photo, imageable: album)
      end
    end
  end
end
