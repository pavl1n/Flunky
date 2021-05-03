# frozen_string_literal: false

# Controller for client profile page
class UserController < ApplicationController
  before_action :authenticate_user!

  def profile
    return if current_user.all_contact_info_filled?

    redirect_to edit_user_path(current_user)
  end

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
