# frozen_string_literal: false

# Model which describes users
class User < ApplicationRecord
  has_many :products
  has_many :orders
  enum user_type: { admin: 0, client: 1, restaurant: 2 }
end
