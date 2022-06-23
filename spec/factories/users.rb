FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    nickname {Faker::Name.name}
    transient do
      person {Gimei.name}
    end
      last_name {person.last.kanji}
      first_name {person.first.kanji}
      last_kana_name {person.last.katakana}
      first_kana_name {person.first.katakana}
      birth_day {"2000-01-01"}
    end
end
