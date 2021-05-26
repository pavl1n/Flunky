# frozen_string_literal: false

# Model which binding orders and restaurants
class RestaurantOrder < ApplicationRecord
  before_save :set_subtotal
  belongs_to :order
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  has_many :order_positions
  has_many :products, through: :order_positions
  enum status: { waiting: 0, in_progress: 1, done: 2 }

  def subtotal
    order_positions.collect { |position| position.valid? ? position.unit_price * position.quantity : 0 }.sum
  end

  private
  def set_subtotal
    self[:subtotal] = subtotal
  end
end
