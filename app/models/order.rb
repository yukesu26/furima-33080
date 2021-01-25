class Order
  include ActiveModel::Model
  attr_accessor :nick_name, :email, :encrypted_passwod, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, :post_code, :shipping_place_id, :city, :address, :phone_number, :building_name
  
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_place_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
    validates :building_name

    def save
　     Destination.create(post_code: post_code, shipping_place_id: shipping_place_id, city: city, address: address, phone_number: phone_number, building_name: building_name, user_id: user.id)
       Buy.create(product_id: product_id, user_id: user_id)
    end


end