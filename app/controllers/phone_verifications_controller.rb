# frozen_string_literal: true

require_relative '../lib/constants'

# Sending sms to verify user
class PhoneVerificationsController < ApplicationController
  include Constant
  def new; end

  def create
    session[:phone_number] = params[:phone_number]
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
      redirect
    else
      render :challenge
    end
  end

  def redirect
    session[:phone_number] = nil
    current_user.update(confirmed: true)
    redirect_to success_phone_verifications_path
  end

  def success; end
end
