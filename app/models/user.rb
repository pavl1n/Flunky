# frozen_string_literal: false

# Model which describes users
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2 twitter]

  has_many :products
  has_many :orders
  enum user_type: { admin: 0, client: 1, restaurant: 2 }

  validates :phone_number, uniqueness: true, phone: { possible: true, types: :mobile, countries: :by }, allow_nil: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.phone_number = nil
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if conditions[:phone_number]
      find_by_phone_number(conditions[:phone_number])
    elsif conditions[:email]
      find_by_email(conditions[:email])
    elsif conditions.key?(:reset_password_token)
      find_by_reset_password_token(conditions[:reset_password_token])
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
