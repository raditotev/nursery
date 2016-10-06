FactoryGirl.define do
  factory :admin do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
  end
  factory :super_admin, class: Admin do
    username "radi"
    email "radi@mail.com"
    password "password"
    superadmin true
  end
end
