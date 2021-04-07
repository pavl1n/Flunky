# Model which binding orders and restaurants
class RestaurantOrder < ApplicationRecord
  belongs_to :order
  belongs_to :user, -> { where user_type: :restaurant }
  has_and_belongs_to_many :products
  enum status: { waiting: 0, in_progress: 1, done: 2 }
end
