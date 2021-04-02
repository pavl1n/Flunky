class Order < ApplicationRecord
  enum state: { approved: 0, rejected: 1 }
  enum status: { waiting: 0, in_progress: 1, done: 2 }
  enum payment_type: { cash: 0, card: 1 }
end
