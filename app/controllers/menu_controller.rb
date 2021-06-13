# frozen_string_literal: false

# Controller for main page
class MenuController < ApplicationController
  before_action :init_cart
  def index
    @pagy, @product = pagy(Product.all)
  end
end
