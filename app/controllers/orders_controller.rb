# frozen_string_literal: false

# Controller to show each user products
class OrdersController < ApplicationController
  def index
    @orders = Order.approved.where(client_id: current_user.id).includes([:order_positions]).includes([:products])
  end
end
