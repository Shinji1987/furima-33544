FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    delivery_pay_method_id { 2 }
    sender_region_id { 2 }
    delivery_duration_id { 2 }
    price { 1000 }

    association :user
  end
end
