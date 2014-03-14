require 'faker'

FactoryGirl.define do
  factory :comment do
    author_id { rand(1000) }
    idea_id { rand(1000) }
    text { Faker::Lorem.paragraph(20) }
  end
end
