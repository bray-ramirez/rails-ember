FactoryGirl.define do
  factory :recipe do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }

    association :user
  end
end
