# frozen_string_literal: false

# Creating current_order variable
class CurrentOrderController < ApplicationController
  def current_order
    @current_order ||= Order.find_by_id(session[:order_id]) || Order.new
  end
end
