FactoryGirl.define do
  factory :job do
    title "Job"
    description { Faker::Lorem.paragraph(2) }
  end

end
