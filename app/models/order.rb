class Order < ApplicationRecord
  has_one :client
  has_many :restaurants, through: :products
  enum status: { waiting: 0, in_progress: 1, done: 2 }
  enum payment_type: { cash: 0, card_upon_receipt: 1 }
end
