require 'faker'

Award.destroy_all
Faq.destroy_all
Job.destroy_all
Newsletter.destroy_all
Parent.destroy_all
Testemonial.destroy_all
Break.destroy_all

10.times do
  Award.create(title: Faker::Name.title, description: Faker::Lorem.paragraph(2))
  Faq.create(question: Faker::Lorem.sentence + "?", answer: Faker::Lorem.sentence)
  Job.create(title: Faker::Space.company, description: Faker::Lorem.paragraph(2))
  Newsletter.create(name: Faker::Lorem.sentence, url: Faker::Internet.url)
  Parent.create(email: Faker::Internet.email, password: "password", title: Faker::Name.prefix,
                          first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  Testemonial.create(title: Faker::Name.title, description: Faker::Lorem.paragraph(2))
end

Break.create(start_date: Date.new(2016, 8, 20),
                      end_date: Date.new(2016, 8, 23),
                      description: Faker::Lorem.paragraph(1))

Break.create(start_date: Date.new(2016, 9, 26),
                      end_date: Date.new(2016, 9, 30),
                      description: Faker::Lorem.paragraph(1))

Break.create(start_date: Date.new(2016, 12, 24),
                      end_date: Date.new(2017, 1, 5),
                      description: Faker::Lorem.paragraph(1))
