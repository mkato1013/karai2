FactoryBot.define do
  factory :like do
    association :user
    association :food
  end
end
