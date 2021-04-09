class ProductRestOrder < ApplicationRecord
  belongs_to :product
  belongs_to :restaurant_order
end
