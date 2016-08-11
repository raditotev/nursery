FactoryGirl.define do
  factory :newsletter do
    name "Newsletter Title"
    document { fixture_file_upload "#{Rails.root}/spec/support/documents/test.pdf", 'application/pdf' }
  end
end
