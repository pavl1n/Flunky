module RestaurantOrderHelper
  def find_products_name(order)
    order.order.products.select { |product| current_user.id == product.restaurant.id }.map(&:name)
  end

  def find_products_quantity(order)
    order.order.order_positions.select { |position| current_user.id == position.product.restaurant.id }.map(&:quantity)
  end
end
