class RequestsController < ApplicationController
  def index; end

  def show; end

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

  private

  def request_params
    params.require(:request).permit(
      :email,
      :description
    )
  end
end
