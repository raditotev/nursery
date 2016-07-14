FactoryGirl.define do
  factory :award do
    title "Staff Award"
    description { Faker::Lorem.paragraph(2) }
  end

end
