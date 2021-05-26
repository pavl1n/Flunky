class CartController < ApplicationController
  def show
    @order_positions = current_order.order_positions
  end
end
