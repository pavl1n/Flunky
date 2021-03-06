# frozen_string_literal: false

# Model for product entity
class Product < ApplicationRecord
  include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
  has_one_attached :product_picture
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  has_many :order_positions
  has_many :comments, dependent: :destroy
  scope :approved, -> { where(approved: true) }
  accepts_nested_attributes_for :comments
  after_commit :update_indices, on: %i[create update]
  has_many :orders, through: :order_positions
  validates :name, :price, :category, :description, presence: true
  validates_numericality_of :price
  validates :description, length: { maximum: 100 }
  validates :product_picture, attached: true, content_type: %i[png jpg jpeg]

  settings do
    mappings dynamic: false do
      indexes :name, type: :text
      indexes :category, type: :text
      indexes :description, type: :text
    end
  end

  after_commit :update_index_on_destroy, on: :destroy

  def update_index_on_destroy
    __elasticsearch__.client.delete(
      index: Product.index_name,
      type: Product.document_type,
      id: id
    )
  end

  def update_indices
    Product.import force: true
  end

  def self.search(params)
    query = "*#{params}*"
    es = __elasticsearch__.search(
      query: { query_string: { query: query } },
      size: 20
    )
    es.records.to_a
  end
end
