FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    state_id { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    ship_from_id { Faker::Number.between(from: 2, to: 48) }
    ship_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    before(:create) do |item|
      item.image.attach(io: File.open('spec/fixtures/files/test_image.png'), filename: 'test_image.png')
    end
  end
end
