require 'faker'

FactoryGirl.define do
  factory :idea do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph(3) }
    owner_id { rand(1000) }
  end
end
