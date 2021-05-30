class OrdersController < ApplicationController
  def index
    @order_positions = current_order.order_positions
  end
end
