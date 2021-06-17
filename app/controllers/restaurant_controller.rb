# frozen_string_literal: false

# Pages for restaurant and their products
class RestaurantController < ApplicationController
  before_action :init_cart
  def index
    @pagy, @restaurants = pagy(User.restaurant.includes(avatar_attachment: :blob))
  end

  def show
    @restaurant = User.find(params[:id])
  end

  def products
    @products = User.find(params[:restaurant_id]).products.includes(product_picture_attachment: :blob)
  end
end
