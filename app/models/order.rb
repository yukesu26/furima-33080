class Order
  include ActiveModel::Model
  attr_accessor :nick_name, :email, :encrypted_passwod, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, :post_code, :shipping_place_id, :city, :address, :phone_number, :building_name
  with_options presence: true do
    validates :nick_name
    validates :email, uniqueness: true 
    validates :birth_day
    validates :last_name
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_place_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
     
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
    validates :last_name
    validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana 
    validates :first_name_kana 
    end
  end
    validates :password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :building_name

    def save
       user = User.create(nich_name: nick_name, email: email, encrypted_passwod: encrypted_passwod, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birth_day: birth_day)
      # 住所の情報を保存
      Destination.create(post_code: post_code, shipping_place_id: shipping_place_id, city: city, address: address, phone_number: phone_number, building_name: building_name, user_id: user.id)
      # 寄付金の情報を保存
      Buy.create(product_id: product_id, user_id: user.id)
    end


end