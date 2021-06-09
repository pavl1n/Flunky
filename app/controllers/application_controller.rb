# frozen_string_literal: false

# This module smells of :reek:IrresponsibleModule
class ApplicationController < ActionController::Base
  before_action :join_order_to_client, if: -> { current_order.client_id.nil? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_order
    @current_order ||= Order.find_by_id(session[:order_id]) || Order.new
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number])
  end

  def join_order_to_client
    current_order.update(client_id: current_user.id) if user_signed_in? && !current_order.nil?
  end
end
