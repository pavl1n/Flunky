# frozen_string_literal: false

# Model for product entity
class Product < ApplicationRecord
  has_one_attached :product_picture
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  has_many :order_positions
  has_many :restaurant_orders, through: :order_positions
  validates :name, :price, :category, :description, presence: true
  validates_numericality_of :price, message: 'only allows digits'
  validates :description, length: { maximum: 100 }
  validates :product_picture, attached: true, content_type: %i[png jpg jpeg]
end
