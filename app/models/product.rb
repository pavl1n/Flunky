class Product < ApplicationRecord
  belongs_to :user, -> { where user_type: :restaurant }
end
