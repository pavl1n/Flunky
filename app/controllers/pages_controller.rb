# frozen_string_literal: false

# Implementing search action
class PagesController < ApplicationController
  def search
    @product = Product.search(params[:query]) if params[:query].presence
  end
end
