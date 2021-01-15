FactoryBot.define do
  factory :order_delivery_address do
    postal_code { '238-0048' }
    prefecture_id { 2 }
    city_town { '横須賀市' }
    street_number { '1-1' }
    building_name { 'グリーンコーポ' }
    phone_number { '09034566666' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
