# frozen_string_literal: false

# Responsible for managing orders
class RestaurantOrdersController < ApplicationController
  def index
    @rest_orders = RestaurantOrder.where(user_id: current_user.id)
  end

  def update
    if params[:do] == 'approve'
      OrderService.new(RestaurantOrder.find_by_id(params[:restaurant_order])).approve_restaurant
      flash[:notice] = "Order #{params[:restaurant_order]} approved"
    end
    return unless params[:do] == 'finish'

    OrderService.new(RestaurantOrder.find_by_id(params[:restaurant_order])).finish
    flash[:notice] = "Order #{params[:restaurant_order]} finished"
  end
end
