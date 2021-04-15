# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  def index
    @restaurants = User.restaurant
    @product = Product.all
  end
end
