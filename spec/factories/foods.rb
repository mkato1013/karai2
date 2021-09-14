FactoryBot.define do
  factory :food do
    meal_type_id          {0}
    shop_name             {Faker::Name.name}
    shop_name_kana        {Faker::Name.name}
    food_name             {Faker::Name.name}
    spicy_level_id        {5}
    station               {""}
    shop_mood_id          {0}
    waiting_time_id       {0}
    food_comment          {""}
    association :user

    after(:build) do |food|
      food.image.attach(io: File.open('app/assets/images/sample.png'), filename: 'sample.png')
    end
  end
end