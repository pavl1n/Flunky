# frozen_string_literal: false

# Responsible for managing orders
class RestaurantOrdersController < ApplicationController
  def index
    @rest_orders = RestaurantOrder.where(user_id: current_user.id)
  end

  def approve
    order_service(RestaurantOrder.find_by_id(params[:restaurant_order])).approve_restaurant
  end

  def finish
    order_service(RestaurantOrder.find_by_id(params[:restaurant_order])).finish
  end
end
