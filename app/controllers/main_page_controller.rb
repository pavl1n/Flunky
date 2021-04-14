class MainPageController < ApplicationController
  def index
    @users = User.restaurant
    @product = Product.all
  end
end
