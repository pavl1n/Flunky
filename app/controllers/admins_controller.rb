# frozen_string_literal: false

# Approving restaurants and products
class AdminsController < ApplicationController
  def update
    Product.find(params[:product_id]).update(approved: true) if params[:product_id]
    User.find(params[:restaurant_id]).update(confirmed: true) if params[:restaurant_id]
    redirect_back fallback_location: root_path
  end
end
