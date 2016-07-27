FactoryGirl.define do
  factory :award do
    title "Staff Award"
    description { Faker::Lorem.paragraph(2) }
    photo { fixture_file_upload "#{Rails.root}/spec/support/images/test_img.png", 'image/png' }
  end
end
