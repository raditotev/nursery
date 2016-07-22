FactoryGirl.define do
  factory :newsletter do
    name "Newsletter"
    url { Faker::Internet.url }
  end
end
