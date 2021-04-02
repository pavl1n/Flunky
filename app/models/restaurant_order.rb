class RestaurantOrder < ApplicationRecord
  enum state: { approved: 0, rejected: 1 }
  enum status: { waiting: 0, in_progress: 1, done: 2 }
end
