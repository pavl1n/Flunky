# frozen_string_literal: false

# Model which binding orders and restaurants
class RestaurantOrder < ApplicationRecord
  scope :approved, -> { where(approved: true) }
  belongs_to :order
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  enum status: { waiting: 0, in_progress: 1, done: 2 }

  def find_products_name(current_user)
    order.products.select { |product| current_user.id == product.restaurant.id }.map(&:name)
  end

  def find_products_quantity(current_user)
    order.order_positions.select { |position| current_user.id == position.product.restaurant.id }.map(&:quantity)
  end
end
