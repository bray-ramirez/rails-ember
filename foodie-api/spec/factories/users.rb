require 'faker'


FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "user#{n}@email.com"}
    password { Faker::Internet.password }


    trait :admin do
      admin true
    end
  end
end
