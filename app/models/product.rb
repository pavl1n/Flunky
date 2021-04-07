class Product < ApplicationRecord
  belongs_to :user, -> { where user_type: :restaurant }
  # belongs_to :restaurant_order
end
