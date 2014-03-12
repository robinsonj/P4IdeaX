require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(20) }
  end
end
