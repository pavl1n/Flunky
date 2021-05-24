# frozen_string_literal: false

# Here describes steps after clients registration
class RestaurantStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_information, :products

  def show
    @restaurant = current_restaurant
    @product = current_restaurant.products.build
    render_wizard
  end

  def update
    @restaurant = current_restaurant
    @restaurant.update(rest_params)
    render_wizard @restaurant
  end

  private

  def rest_params
    params.require(:user).permit(
      :name,
      :email,
      :city,
      :street,
      :house_number,
      :avatar
    ).merge(create_stage: 2)
  end
end
