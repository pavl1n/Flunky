# frozen_string_literal: false

# Here describes steps after clients registration
class RestaurantStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_information, :dishes

  def show
    @product = current_restaurant.products.new
    @restaurant = current_restaurant
    render_wizard
  end

  def dishes
    @product = current_restaurant.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path }
      else
        format.html { render action: :create }
      end
    end
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
      :city
    ).merge(create_stage: 1)
  end

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :category,
      :description
    )
  end
end
