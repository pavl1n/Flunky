# frozen_string_literal: false

module Users
  # Controller for omniauth to get data from outside services
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # rubocop:disable Metrics/AbcSize
    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_user_registration_path
      end
    end
    # rubocop:enable Metrics/AbcSize

    def failure
      redirect_to root_path
    end
  end
end
