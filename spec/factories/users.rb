FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    first_name {Gimei.first.kanji}
    last_name {Gimei.last.kanji }
    kana_first_name {Gimei.first.katakana}
    kana_last_name {Gimei.last.katakana}
    birthday {Faker::Date.in_date_period}
    password { '1a' + Faker::Internet.password(min_length: 6,)}
    password_confirmation {password}
  end
end