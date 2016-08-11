FactoryGirl.define do
  factory :job do
    title "New Job Opening"
    description { Faker::Lorem.paragraph(2) }
  end

end
