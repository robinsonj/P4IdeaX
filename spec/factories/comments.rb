require 'faker'

FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.paragraph(20) }
  end
end
