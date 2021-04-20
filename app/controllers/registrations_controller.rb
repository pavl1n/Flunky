# frozen_string_literal: false

# Override devise after paths
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    current_user.update(user_type: 1)
    after_signup_index_path
  end
end
