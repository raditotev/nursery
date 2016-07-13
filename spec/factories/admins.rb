FactoryGirl.define do
  factory :admin do
    name { Faker::Name.last_name.downcase }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    superadmin false
  end
  factory :super_admin, class: Admin do
    name { Faker::Name.last_name.downcase }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    superadmin true
  end
end
