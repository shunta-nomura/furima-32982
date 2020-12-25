FactoryBot.define do
  factory :buy_item do
    post_number { '123-4566' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city_name { Gimei.city.kanji }
    address { '青山1-1-1' }
    building_name { '東京ライオンズヒルズ' }
    call_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
