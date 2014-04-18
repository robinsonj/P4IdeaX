require 'faker'

FactoryGirl.define do
  factory :user do
    name      { Faker::Internet.user_name }
    email     { Faker::Internet.email }
    password  { Faker::Lorem.characters(20) }
  end

  factory :twitter_user, class: User do
    name      { Faker::Internet.user_name }
    password  { Devise.friendly_token }
    provider  { 'twitter' }
    uid       { rand(100000000).to_s }
  end

  factory :facebook_user, class: User do
    name      { Faker::Internet.user_name }
    password  { Devise.friendly_token }
    provider  { 'facebook' }
    uid       { rand(100000000).to_s }
  end
end
