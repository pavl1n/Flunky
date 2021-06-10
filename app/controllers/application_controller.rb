# frozen_string_literal: false

# This module smells of :reek:IrresponsibleModule
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_order
    @current_order ||= Order.find_by_id(session[:order_id]) || create_order
  end

  def create_order
    current_user.nil? ? Order.new : Order.new(client_id: current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number])
  end
end
