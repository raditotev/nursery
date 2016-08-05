FactoryGirl.define do
  factory :admin do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
  end
  factory :super_admin, class: Admin do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    superadmin true
  end
end
