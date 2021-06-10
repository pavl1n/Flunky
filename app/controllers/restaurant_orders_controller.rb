# frozen_string_literal: false

# Responsible for managing orders
class RestaurantOrdersController < ApplicationController
  def index
    @rest_orders = RestaurantOrder.where(user_id: current_user.id)
  end

  def update
    if params[:status] == 'approve'
      OrderService.new(RestaurantOrder.find_by_id(params[:restaurant_order])).approve_restaurant
      flash[:notice] = "Order #{params[:restaurant_order]} approved"
    end
    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
    return unless params[:status] == 'finish'

    OrderService.new(RestaurantOrder.find_by_id(params[:restaurant_order])).finish
    flash[:notice] = "Order #{params[:restaurant_order]} finished"
  end
end
