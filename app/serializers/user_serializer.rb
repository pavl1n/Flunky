# frozen_string_literal: false

class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :city, :phone_number, :user_type, :email, :street, :house_number
end
