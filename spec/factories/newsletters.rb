FactoryGirl.define do
  factory :newsletter do
    name "Newsletter"
    url { Faker::Internet.url }
    document { fixture_file_upload "#{Rails.root}/spec/support/documents/test.pdf", 'application/pdf' }
  end
end
