class PhoneVerificationsController < ApplicationController
  def new
  end

  def create
    session[:phone_number] = params[:phone_number]
    session[:country_code] = params[:country_code]
    @response = Authy::PhoneVerification.start(
      via: params[:method],
      country_code: '+375',
      phone_number: params[:phone_number]
    )
    if @response.ok?
      redirect_to challenge_phone_verifications_path
    else
      render :_new
    end

  end

  def challenge
  end

  def verify
    @response = Authy::PhoneVerification.check(
      verification_code: params[:code],
      country_code: '+375',
      phone_number: session[:phone_number]
    )
    if @response.ok?
      session[:phone_number] = nil
      session[:country_code] = nil
      current_user.update(confirmed: true)
      redirect_to success_phone_verifications_path
    else
      render :challenge
    end
  end

  def success
  end
end
