# frozen_string_literal: false

# Responsible for showing cart and updating status of order
class CartController < ApplicationController
  before_action :skip_footer
  def show
    @order_positions = current_order.order_positions
  end

  def approve
    current_order.update(approved: true)
    OrderService.new(current_order).create_restaurant_order
    redirect_to root_path
    flash[:notice] = 'Order was succesfully created'
  end

  private

  def skip_footer
    @skip_footer = true
  end
end
