FactoryGirl.define do
  factory :vote do
    value { rand(10) > 5 ? 1 : -1 }
  end
end
