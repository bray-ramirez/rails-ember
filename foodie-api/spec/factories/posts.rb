require 'faker'


FactoryGirl.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }

    association :user


    trait :published do
      visible true
    end
  end
end
