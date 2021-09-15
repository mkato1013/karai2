FactoryBot.define do
  factory :comment do
    text             {'aaaa'}
    association :user
    association :food
  end
end
