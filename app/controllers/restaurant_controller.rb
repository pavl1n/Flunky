# frozen_string_literal: false

# Pages for restaurant and their products
class RestaurantController < ApplicationController
  include Constants
  before_action :init_cart
  def index
    @restaurants = admin(current_user) ? User.restaurant : User.restaurant.confirmed
    @pagy, @list_of_restaurants = pagy(@restaurants.includes(avatar_attachment: :blob), items: ITEMS)
  end

  def show
    @restaurant = User.find(params[:id])
  end

  def products
    @products = User.find(params[:restaurant_id]).products.includes(product_picture_attachment: :blob)
  end

  def destroy
    if User.find(params[:id]).destroy
      redirect_back fallback_location: root_path
      flash[:notice] = 'Restaurant was successfully destroyed.'
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
end
