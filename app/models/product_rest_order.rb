class ProductRestOrder < ApplicationRecord
  belongs_to :products
  belongs_to :restaurant_orders
end
