# frozen_string_literal: false

class Product < ApplicationRecord
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  has_many :product_rest_orders
  has_many :restaurant_orders, through: :product_rest_orders
end
