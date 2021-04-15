class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(_resource)
    edit_user_path(current_user)
  end
end
