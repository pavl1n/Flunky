# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  include Constants
  before_action :init_cart
  def index
    @product = admin(current_user) ? Product.all : Product.approved
    @pagy, @products = pagy(@product.includes([:restaurant]).includes(product_picture_attachment: :blob), items: ITEMS_PER_PAGE)
  end

  private

  def admin(user)
    user_signed_in? && user.admin?
  end
end
