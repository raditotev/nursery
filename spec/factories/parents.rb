FactoryGirl.define do
  factory :parent do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    title { Faker::Name.prefix }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
