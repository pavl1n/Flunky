# frozen_string_literal: false

# Model which describes users
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders
  enum user_type: { admin: 0, client: 1, restaurant: 2 }
end
