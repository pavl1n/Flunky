# frozen_string_literal: false

# Responsible for requests from replying form
class RequestsController < ApplicationController
  def index; end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
      RestaurantRequestMailer.welcome_email(request_params[:email]).deliver_now
      flash[:notice] = 'Request accepted'
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(
      :email,
      :description
    )
  end
end
