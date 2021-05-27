class OrderPositionsController < ApplicationController
  before_action :set_order
  def create
    @order_positions = @order.order_positions.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    binding.pry
    @order_positions = @order.order_positions.find(params[:id])
    @order_positions.update_attribute(order_params)
    @order_positions = current_order.order_positions
  end

  def destroy
    @order_positions = @order.order_positions.find(params[:id])
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
