json.extract! user, :id, :name, :city, :email, :password, :login_status, :user_type, :created_at, :updated_at
json.url user_url(user, format: :json)
