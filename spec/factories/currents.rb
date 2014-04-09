require 'faker'

FactoryGirl.define do
  factory :current do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph(3) }
  end
end
