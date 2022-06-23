FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
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
