# frozen_string_literal: false

# Here describes steps after clients registration
class RestaurantStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_information, :products

  def show
    @product = current_restaurant.products.build
    render_wizard
  end

  def update
    current_restaurant.update(rest_params)
    sign_in(current_restaurant, bypass: true)
    render_wizard current_restaurant
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
