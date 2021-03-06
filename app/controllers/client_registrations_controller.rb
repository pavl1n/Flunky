# frozen_string_literal: false

# Override devise after paths
class ClientRegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    super.merge(user_type: 1, create_stage: 0)
  end

  def after_sign_up_path_for(_resource)
    current_order.update(client_id: current_user.id)
    after_signup_index_path
  end

  def after_update_path_for(_resource)
    profile_user_index_path
  end
end
