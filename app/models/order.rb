# frozen_string_literal: false

# Model for orders
class Order < ApplicationRecord
  scope :approved, -> { where(approved: true) }
  before_save :set_subtotal
  scope :approved, -> { where(approved: true) }
  has_many :restaurant_orders
  has_many :order_positions, dependent: :delete_all
  has_many :products, through: :order_positions
  enum status: { waiting: 0, in_progress: 1, done: 2, cancel: 3 }
  enum payment_type: { cash: 0, card_upon_receipt: 1 }

  def subtotal
    order_positions.collect { |position| position.valid? ? position.unit_price * position.quantity : 0 }.sum
  end

  private

  def set_subtotal
    self.subtotal = subtotal
  end
end
