# frozen_string_literal: false

# Override devise after paths
class ClientRegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    super.merge(user_type: 1)
  end

  def after_sign_up_path_for(_resource)
    after_signup_index_path
  end

  def update_resource(resource, params)
    return super if params['password']&.present?

    resource.update_without_password(params.except('current_password'))
  end

  def after_update_path_for(_resource)
    user_registration_profile_path
  end
end
