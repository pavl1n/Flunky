class RestaurantOrder < ApplicationRecord
  belongs_to :order
  has_many :users
  enum status: { waiting: 0, in_progress: 1, done: 2 }
end
