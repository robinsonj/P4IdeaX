require 'faker'

FactoryGirl.define do
  factory :comment do
    author_id { 1 }
    idea_id { 1 }
    text { Faker::Lorem.paragraph(20) }
  end
end
