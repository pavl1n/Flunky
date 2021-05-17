# frozen_string_literal: false

# Here describes steps after clients registration
class RestaurantStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_information, :dishes

  def show
    @restaurant = current_restaurant
    @product = current_restaurant.products.new
    render_wizard
  end

  def update
    @restaurant = current_restaurant
    @restaurant.update(user_params)
    render_wizard @restaurant
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :city,
      products_attributes: %i[name price category description _destroy]
    ).merge(create_stage: 1)
  end
end
