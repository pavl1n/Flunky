# frozen_string_literal: false

# Controller for client profile page
class UserController < ApplicationController
  before_action :authenticate_user!

  def phone_number; end

  def profile
    return redirect_to edit_phone_number_user_path(current_user) unless current_user.phone_number
    return redirect_to edit_user_path(current_user) unless current_user.all_contact_info_filled?
  end

  def edit
    redirect_to edit_phone_number_user_path(current_user) if current_user.phone_number.blank?
  end

  def edit_phone_number; end

  def update
    respond_to do |format|
      if current_user.update(user_params.merge(create_stage: 1))
        format.html { current_user.confirmed ? (redirect_to user_profile_path) : (redirect_to after_signup_index_path) }
      else
        format.html { render action: :edit }
      end
    end
  end

  def update_phone_number
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to after_signup_index_path }
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
