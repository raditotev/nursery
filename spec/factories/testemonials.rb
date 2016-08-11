FactoryGirl.define do
  factory :testemonial do
    title "Testemonial Title"
    description { Faker::Lorem.paragraph(2) }
  end

end
