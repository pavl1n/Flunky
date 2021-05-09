# frozen_string_literal: true

# Sending sms to verify user
class PhoneVerificationsController < ApplicationController
  include Constants
  def new; end

  def create
    session[:phone_number] = params[:phone_number]
    current_user.update(phone_number: params[:phone_number]) if current_user.phone_number.nil?
    session[:country_code] = params[:country_code]
    @response = Authy::PhoneVerification.start(
      via: params[:method],
      country_code: PHONE_CODE,
      phone_number: session[:phone_number]
    )
    redirect_to challenge_phone_verifications_path if @response.ok?
  end

  def challenge; end

  def verify
    @response = Authy::PhoneVerification.check(
      verification_code: params[:code],
      country_code: PHONE_CODE,
      phone_number: session[:phone_number]
    )
    if @response.ok?
      redirect_to success_phone_verifications_path if current_user.update_attribute(:confirmed, true)
    else
      render :challenge
    end
  end

  def success; end
end
