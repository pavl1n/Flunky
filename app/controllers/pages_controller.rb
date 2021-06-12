class PagesController < ApplicationController
  def search
    @product = Product.search(params[:query]) if params[:query].presence
  end
end
