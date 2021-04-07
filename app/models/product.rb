class Product < ApplicationRecord
  belongs_to :user, -> { where user_type: :restaurant }
  has_and_belongs_to_many :restaurant_orders
end
