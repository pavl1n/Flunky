# frozen_string_literal: false

# Responsible for showing cart and updating status of order
class CartController < CurrentOrderController
  def show
    @order_positions = current_order.order_positions
  end

  def approve
    current_order.update(approved: true)
    redirect_to root_path
    flash[:notice] = 'Order was succesfully created'
  end
end
