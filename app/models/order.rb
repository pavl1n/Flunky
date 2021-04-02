class Order < ApplicationRecord
  has_many :products
  has_many :users
  enum status: { waiting: 0, in_progress: 1, done: 2 }
  enum payment_type: { cash: 0, card_upon_receipt: 1 }
end
