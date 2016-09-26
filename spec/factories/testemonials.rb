FactoryGirl.define do
  factory :testemonial do
    description { Faker::Lorem.paragraph(2) }
    name { Faker::Name.first_name }
  end

end
