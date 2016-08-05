FactoryGirl.define do
  factory :newsletter do
    name "Newsletter"
    document { fixture_file_upload "#{Rails.root}/spec/support/documents/test.pdf", 'application/pdf' }
  end
end
