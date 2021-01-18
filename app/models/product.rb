class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
  validates :image
  validates :name
  validates :memo
  validates :category
  validates :item_state
  validates :delivery_fee
  validates :shipping_place
  validates :send_day
  validates :price
  end
  
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :item_state
  belongs_to :send_day
  belongs_to :shipping_place
end
