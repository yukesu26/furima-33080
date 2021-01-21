 FactoryBot.define do
  factory :product do
    name                 {"てとてと"}
    memo                 {"ととと"}
    price                {1000}
    category_id          {2}
    item_state_id        {2}
    delivery_fee_id      {2}
    shipping_place_id    {2} 
    send_day_id          {2}
    user_id              {2}
    association :user 
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end