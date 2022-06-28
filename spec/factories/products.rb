FactoryBot.define do
  factory :product do
    item {"アイテム"}
    price {"3000"}
    explain {"サンプル品です。"}
    category_id { 5 }
    condition_id { 3 }
    postage_id { 3 }
    send_area_id { 14 }
    send_day_id { 2 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
