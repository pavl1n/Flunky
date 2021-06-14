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

  def destroy
    respond_to do |format|
      if User.find(params[:id]).destroy
        format.html { redirect_to root_path, notice: 'Restaurant was successfully destroyed.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
end
