FactoryBot.define do
  factory :order do
    post_code {'123-4567'}
    shipping_place_id {2}
    city {'青森市'}
    address {'青森1-2-3'}
    phone_number {'09012345678'}
    building_name {''}
  end
end
