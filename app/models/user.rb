class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name
    validates :email, uniqueness: true 
    validates :birth_day
    validates :last_name

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
  
    has_many :products
    has_many :buys
end
