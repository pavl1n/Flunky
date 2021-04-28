# frozen_string_literal: false

# This module smells of :reek:IrresponsibleModule
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email city])
  end
end
