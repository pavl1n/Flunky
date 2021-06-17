# frozen_string_literal: false

# Model for accepting requests
class Request < ApplicationRecord
  scope :not_approved, -> { where(approved: nil) }
  validates :email, :description, presence: true
end
