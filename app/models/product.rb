# frozen_string_literal: false

# Model for product entity
class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_one_attached :product_picture
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  has_many :order_positions
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  has_many :orders, through: :order_positions
  validates :name, :price, :category, :description, presence: true
  validates_numericality_of :price, message: 'is not a number'
  validates :description, length: { maximum: 100 }
  validates :product_picture, attached: true, content_type: %i[png jpg jpeg]

  settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :category, type: :text, analyzer: :english
      indexes :description, type: :text, analyzer: :english
    end
  end
end
