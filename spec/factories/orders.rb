FactoryBot.define do
  factory :order do
    postal_code {"123-4567"}
    send_area_id {15}
    municipalities {"横浜市"}
    address {"1-23-4"}
    building {"ランドマークタワー8743号室"}
    phone_number {"08012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :product
  end
end
