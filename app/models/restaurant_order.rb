# Model which binding orders and restaurants
class RestaurantOrder < ApplicationRecord
  belongs_to :order, -> { where status: 'in_progress' }
  has_many :restaurants
  enum status: { waiting: 0, in_progress: 1, done: 2 }
end
