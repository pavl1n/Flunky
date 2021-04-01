class MainPageController < ApplicationController
  def index
    @users = User.where(user_type: 'restaurant')
    @product = Product.all
  end
end
