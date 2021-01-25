class Buy < ApplicationRecord
has_one :destinations
belongs_to :users
belongs_to :products
end
