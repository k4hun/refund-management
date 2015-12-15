FactoryGirl.define do
  factory :application do
    description Faker::Lorem.sentence
    user
  end
end