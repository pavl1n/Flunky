# frozen_string_literal: false

# Responsible for requests from replying form
class RequestsController < ApplicationController
  def index
    @requests = Request.not_approved
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path
      flash[:notice] = 'Request accepted'
    else
      render :new
    end
  end

  def update
    @request = Request.find_by_id(params[:id])
    respond_to do |format|
      if @request.update(approved: params[:approved])
        format.js { render inline: 'location.reload();' }
        RestaurantRequestMailer.welcome_email(@request.email).deliver_now
        flash[:notice] = 'Mail with registration path send'
      end
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
