FactoryBot.define do
  factory :food do
    shop_name             {Faker::Name.name}
    food_name             {Faker::Name.name}
    spicy_level_id        {0}
    association :user

    after(:build) do |food|
      food.image.attach(io: File.open('app/assets/images/sample.png'), filename: 'sample.png')
    end
  end
end
