FactoryGirl.define do
  factory :admin do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    superadmin false
  end
  factory :super_admin, class: Admin do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    superadmin true
  end
end
