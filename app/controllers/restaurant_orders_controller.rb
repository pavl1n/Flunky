# frozen_string_literal: false

# Responsible for managing orders
class RestaurantOrdersController < ApplicationController
  before_action :current_restaurant_order, only: %i[update]

  def index
    @rest_orders = RestaurantOrder.where(user_id: current_user.id)
  end

  def update
    if params[:approved]
      OrderService.new(RestaurantOrder.find_by_id(params[:restaurant_order])).approve_restaurant
      flash[:notice] = "Order #{params[:restaurant_order]} approved"
    end
    case params[:status]
    when 'finish'
      OrderService.new(RestaurantOrder.find_by_id(params[:restaurant_order])).finish
      flash[:notice] = "Order #{params[:restaurant_order]} finished"
    when 'cancel'
      OrderService.new(RestaurantOrder.find_by_id(params[:restaurant_order])).cancel
      flash[:notice] = "Order #{params[:restaurant_order]} canceled"
    end
    respond_to do |format|
      format.js { render inline: 'location.reload();' }
    end
  end

  private

  def current_restaurant_order
    @current_restaurant_order ||= RestaurantOrder.find_by_id(params[:restaurant_order])
  end
end
