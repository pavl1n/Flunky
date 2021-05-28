module ApplicationHelper
  def current_order
    @current_order ||= Order.find_by_id(session[:order_id]).presence || Order.new
  end
end
