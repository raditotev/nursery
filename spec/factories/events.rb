FactoryGirl.define do
  factory :event do
    start_date { Date.today + 1 }
    end_date { Date.today + 3 }
    description { Faker::Lorem.paragraph(1) }
  end

end
