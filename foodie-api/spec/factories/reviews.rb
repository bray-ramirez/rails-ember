FactoryGirl.define do
  factory :review do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }

    association :user
  end
end
