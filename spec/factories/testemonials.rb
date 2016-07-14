FactoryGirl.define do
  factory :testemonial do
    title "Testemonial"
    description { Faker::Lorem.paragraph(2) }
  end

end
