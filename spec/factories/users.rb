FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    kana_last_name        { person.last.katakana }
    kana_first_name       { person.first.katakana }
    birthday              { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
