class OrdersController < ApplicationController
  def index
    @orders = Order.where(client_id: current_user.id)
  end
end
