# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  before_action :create_order
  def index
    @restaurants = User.restaurant
    @product = Product.all
  end

  private

  def create_order
    @order_positions = current_order.order_positions.new
  end
end
