# frozen_string_literal: false

# Responsible for showing cart and updating status of order
class CartController < ApplicationController
  def show
    @order_positions = current_order.order_positions
  end

  def approve
    current_order.update(approved: true)
    OrderService.new(current_order).create_restaurant_order
    redirect_to root_path
    session[:order_id] = nil
    flash[:notice] = 'Order was succesfully created'
  end
end
