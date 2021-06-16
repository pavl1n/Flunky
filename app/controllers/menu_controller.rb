# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  before_action :init_cart
  def index
    if admin(current_user)
      @product = Product.all
    else
      @product = Product.approved
    end
    @pagy, @list_of_products = pagy(@product.includes([:restaurant]).includes(product_picture_attachment: :blob), items: 21)
  end

  private

  def admin(user)
    user_signed_in? && user.admin?
  end
end
