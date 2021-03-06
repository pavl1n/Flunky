# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  include Constants
  before_action :init_cart
  def index
    @product = admin(current_user) ? Product.all : Product.approved.joins(:restaurant).where('users.confirmed is TRUE')
    @pagy, @products = pagy(@product.includes([:restaurant]).includes(product_picture_attachment: :blob), items: ITEMS)
  end
end
