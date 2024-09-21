FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    item_description    { Faker::Lorem.sentence }
    category_id { 5 }
    condition_id { 2 }
    shipping_fee_payer_id { 2 }
    shipping_origin_id { 23 }
    shipping_day_id { 3 }
    item_price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
