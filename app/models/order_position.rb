class OrderPosition < ApplicationRecord
  belongs_to :product
  belongs_to :restaurant_order
end
