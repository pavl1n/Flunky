# frozen_string_literal: false

module Users
  # Controller for omniauth to get data from outside services
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.save(validate: false)
        sign_and_redirect
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        set_flash_message(:notice, :fail, kind: 'Google') if is_navigational_format?
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to root_path
      end
    end

    def twitter
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.save(validate: false)
        sign_and_redirect
        set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
      else
        set_flash_message(:notice, :fail, kind: 'Google') if is_navigational_format?
        session['devise.twitter_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to root_path
      end
    end

    def failure
      redirect_to root_path
    end

    protected

    def sign_and_redirect
      sign_in(@user)
      redirect_to current_user.phone_number.nil? ? edit_user_path(current_user) : root_path
    end
  end
end
