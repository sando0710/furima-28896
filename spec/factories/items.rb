FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    introdction { Faker::Lorem.sentence }
    category_id           { '2' }
    condition_id          { '2' }
    delivery_burden_id    { '2' }
    prefecture_id         { '2' }
    perpare_day_id        { '2' }
    price { '300' }
    association :user
  end
end
