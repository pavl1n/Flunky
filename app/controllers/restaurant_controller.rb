# frozen_string_literal: false

# Pages for restaurant and their products
class RestaurantController < ApplicationController
  before_action :init_cart
  def index
    @restaurants = admin(current_user) ? User.restaurant : User.restaurant.confirmed
    @pagy, @list_of_restaurants = pagy(@restaurants.includes(avatar_attachment: :blob), items: 21)
  end

  def show
    @restaurant = User.find(params[:id])
  end

  def products
    @products = User.find(params[:restaurant_id]).products.includes(product_picture_attachment: :blob)
  end

  def destroy
    respond_to do |format|
      if User.find(params[:id]).destroy
        format.html { redirect_to root_path, notice: 'Restaurant was successfully destroyed.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def admin(user)
    user_signed_in? && user.admin?
  end
end
