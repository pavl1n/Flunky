module ApplicationHelper
  def current_order
    if RestaurantOrder.find_by_id(session[:restaurant_order_id]).nil?
      RestaurantOrder.new
    else
      RestaurantOrder.find_by_id(session[:restaurant_order_id])
    end
  end
end
