# frozen_string_literal: false

# Controller for client profile page
class UserController < ApplicationController
  before_action :authenticate_user!

  def phone_number; end

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
        format.html { current_user.confirmed ? (redirect_to user_profile_path) : (redirect_to after_signup_index_path) }
      else
        format.html { render action: :edit }
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :city,
      :phone_number
    )
  end
end
