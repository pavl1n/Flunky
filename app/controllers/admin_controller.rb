# frozen_string_literal: false

# Approving restaurants and products
class AdminController < ApplicationController
  def approve_product
    Product.find(params[:product_id]).update(approved: true)
    redirect_back fallback_location: root_path
  end

  def approve_restaurant
    User.find(params[:restaurant_id]).update(confirmed: true)
    redirect_back fallback_location: root_path
  end
end
