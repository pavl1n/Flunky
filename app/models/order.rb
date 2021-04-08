# Model for orders
class Order < ApplicationRecord
  belongs_to :client, -> { where user_type: :client }, class_name: 'User', foreign_key: 'user_id'
  has_many :restaurant_orders
  enum status: { waiting: 0, in_progress: 1, done: 2 }
  enum payment_type: { cash: 0, card_upon_receipt: 1 }
end
