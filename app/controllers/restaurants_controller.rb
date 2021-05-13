class RestaurantsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(_resource)
    root_path
  end

  def sign_up_params
    params.require(:user).permit(
      :phone_number,
      :password,
      :password_confirmation
    ).merge(user_type: 2, create_stage: 0)
  end

end
