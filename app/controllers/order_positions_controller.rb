# frozen_string_literal: false

# Creating, updating and deleting order positions
class OrderPositionsController < ApplicationController
  before_action :set_order
  def create
    if (@order_positions = current_order.order_positions.find_by_product_id(params[:order_position][:product_id]))
      @order_positions.quantity += 1
      @order_positions.save
    else
      @order_positions = current_order.order_positions.new(order_params)
      @order.save
    end
    @order_positions.errors.full_message(:error, 'in creating') if @order_positions.errors.any?
    session[:order_id] = current_order.id
  end

  def update
    @order_positions = current_order.order_positions.find_by_id(params[:id])
    @order_positions.errors.full_message(:error, 'in updating') if @order_positions.errors.any?
    @order_positions.update(order_params)
    @order_positions = current_order.order_positions
  end

  def destroy
    @order_positions = current_order.order_positions.find_by_id(params[:id])
    @order_positions.destroy
    @order_positions = current_order.order_positions
  end

  private

  def order_params
    params.require(:order_position).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
