# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  def index
    @restaurants = User.restaurant
    @product = Product.all
    @order_positions = current_order.order_positions
  end
end
