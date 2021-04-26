# frozen_string_literal: false

# Model which describes users
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :orders
  enum user_type: { admin: 0, client: 1, restaurant: 2 }

  validates :phone_number, uniqueness: true, phone: { possible: true, types: :mobile, countries: :by }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if conditions[:phone_number]
      where(phone_number: conditions[:phone_number]).first
    elsif conditions[:email]
      where(email: conditions[:email]).first || where(reset_password_token: conditions[:reset_password_token]).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
