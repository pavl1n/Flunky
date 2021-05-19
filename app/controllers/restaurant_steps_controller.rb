# frozen_string_literal: false

# Here describes steps after clients registration
class RestaurantStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_information, :products

  def show
    @restaurant = current_restaurant
    @product = current_restaurant.products.new
    render_wizard
  end

  def update
    @restaurant = current_restaurant
    @restaurant.update(user_params)
    @restaurant.update(product_params) if :products
    render_wizard @restaurant
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :city,
      :street,
      :house_number,
      :avatar
    ).merge(create_stage: 2)
  end

  def product_params
    params.require(:user).permit(
      products_attributes: %i[name price category description _destroy product_picture]
    )
  end
end
