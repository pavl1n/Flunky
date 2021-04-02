class User < ApplicationRecord
  enum user_type: { admin: 0, client: 1, restaurant: 2 }
end
