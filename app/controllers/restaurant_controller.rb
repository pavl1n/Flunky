# frozen_string_literal: false

# Pages for restaurant and their products
class RestaurantController < ApplicationController
  before_action :init_cart
  before_action :skip_footer
  def show
    @restaurant = User.find(params[:id])
  end

  def products
    @restaurant = User.find(params[:restaurant_id])
  end
end
