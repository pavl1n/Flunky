# frozen_string_literal: false

# Overriding redirect after password reset
class PasswordsController < Devise::PasswordsController
  # rubocop:disable Metrics/AbcSize
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      set_minimum_password_length
      respond_with resource
    end
  end
  # rubocop:enable Metrics/AbcSize

  protected

  def after_resetting_password_path_for(_resource)
    new_user_session_path
  end
end
