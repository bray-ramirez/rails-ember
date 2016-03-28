FactoryGirl.define do
  factory :activity do
    association :user


    trait :blog do
      association :trackable, :factory => :blog
    end


    trait :review do
      association :trackable, :factory => :review
    end


    trait :recipe do
      association :trackable, :factory => :recipe
    end


    trait :create do
      action Activity::ACTION::CREATE
    end


    trait :update do
      action Activity::ACTION::UPDATE
    end


    trait :destroy do
      action Activity::ACTION::DESTROY
    end
  end
end
