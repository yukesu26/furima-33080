class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :memo, length: { maximum: 1000 }
    validates :price, format: {with: /\A[0-9]+\z/}, 
               numericality: { only_integer: true,
                 greater_than: 300, less_than: 9999999 }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id  
    validates :item_state_id
    validates :delivery_fee_id  
    validates :shipping_place_id 
    validates :send_day_id 
    end
  
    belongs_to :category
    belongs_to :delivery_fee
    belongs_to :item_state
    belongs_to :send_day
    belongs_to :shipping_place
    has_one_attached :image
    belongs_to :user
end
