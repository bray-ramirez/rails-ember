FactoryGirl.define do
  factory :blog do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }

    association :user
  end
end
