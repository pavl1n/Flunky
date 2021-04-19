# frozen_string_literal: false

# Override devise after paths
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    after_signup_index_path
  end
end
