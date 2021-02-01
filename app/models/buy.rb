class Buy < ApplicationRecord
has_one :destination
belongs_to :user
belongs_to :product
end

