# frozen_string_literal: false

# OrderPosition connects product and restaurant_order association m2m
class OrderPosition < ApplicationRecord
  belongs_to :product
  belongs_to :order
  before_save :set_unit_price
  before_save :set_total

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total
    unit_price * quantity
  end

  private

  def set_unit_price
    self.unit_price = unit_price
  end

  def set_total
    self.total = total
  end
end
