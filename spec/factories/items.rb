FactoryBot.define do
  factory :item do
    name { Faker::Lorem.words }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 2..11) }
    status_id { Faker::Number.within(range: 2..7) }
    shipping_burden_id { Faker::Number.within(range: 2..3) }
    shipping_area_id { Faker::Number.within(range: 2..48) }
    shipping_day_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/racket.jpeg'), filename: 'racket.jpeg')
    end
  end
end
