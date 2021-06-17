# frozen_string_literal: false

# Model for accepting requests
class Request < ApplicationRecord
  validates :email, :description, presence: true
end
