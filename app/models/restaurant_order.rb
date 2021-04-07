# Model which binding orders and restaurants
class RestaurantOrder < ApplicationRecord
  belongs_to :order
  has_many :products
  belongs_to :user, -> { where user_type: :restaurant }
  enum status: { waiting: 0, in_progress: 1, done: 2 }
end
