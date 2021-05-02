# frozen_string_literal: false

# Controller for client profile page
class UserController < ApplicationController
  before_action :authenticate_user!

  def profile; end

  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_profile_path }
      else
        format.html { render :edit }
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :city
    )
  end
end