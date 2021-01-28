class Order
  include ActiveModel::Model
  attr_accessor :token, :post_code, :shipping_place_id, :city, :address, :phone_number, :building_name, :user_id, :product_id, :buy_id
  
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_place_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token, presence: true
  end
    validate :building_name
    

    def save
      buy = Buy.create(product_id: product_id, user_id: user_id)
      destination = Destination.create(post_code: post_code, shipping_place_id: shipping_place_id, city: city, address: address, phone_number: phone_number, building_name: building_name, buy_id: buy.id)
       
    end


end