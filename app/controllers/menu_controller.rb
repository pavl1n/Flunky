# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  before_action :init_cart
  def index
    @restaurants = User.restaurant
    @product = Product.all
  end
end
