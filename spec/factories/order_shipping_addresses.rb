FactoryBot.define do
  factory :order_shipping_address do

    postal_code { '123-4567' }
    shipping_origin_id { 23 }
    city { '磐田市' }
    street_address { '一言275-3' }
    building_name { 'ハイツ101' }
    phone_number { '090-9947-3225' }
    
  end
end
