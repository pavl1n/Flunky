module Api
  module V1
    class UsersController < ApplicationController

      def index
        users = User.all

        render json: UserSerializer.new(users).serializable_hash.to_json
      end
    end
  end
end
