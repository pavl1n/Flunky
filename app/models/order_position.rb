# frozen_string_literal: false

# OrderPosition connects product and restaurant_order association m2m
class OrderPosition < ApplicationRecord
  belongs_to :product
  belongs_to :restaurant_order
end
