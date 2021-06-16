# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  before_action :init_cart
  def index
    @product = admin(current_user) ? Product.all : Product.approved
    @pagy, @products = pagy(@product.includes([:restaurant]).includes(product_picture_attachment: :blob), items: 21)
  end

  private

  def admin(user)
    user_signed_in? && user.admin?
  end
end
