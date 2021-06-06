class RestaurantController < ApplicationController
  def show
    @restaurant = User.find(params[:id])
  end

  def products
    @restaurant = User.find(params[:restaurant_id])
  end
end
