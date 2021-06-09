# frozen_string_literal: false

# Join's each order to user after login
class SessionsController < Devise::SessionsController
  after_action :after_login, only: :create, unless: -> { Order.find_by_id(session[:order_id]).nil? }
  def after_login
    current_order.update(client_id: current_user.id)
  end
end
