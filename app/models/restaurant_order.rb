# frozen_string_literal: false

# Model which binding orders and restaurants
class RestaurantOrder < ApplicationRecord
  belongs_to :order
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  enum status: { waiting: 0, in_progress: 1, done: 2 }
end
