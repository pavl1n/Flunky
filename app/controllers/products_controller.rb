# frozen_string_literal: false

# Actions for product model
class ProductsController < ApplicationController
  def new
    @product = current_user.products.build
  end

  def create
    respond_to do |format|
      if current_user.update(product_params)
        format.html { redirect_to root_path, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def product_params
    params.require(:user).permit(
      products_attributes: %i[id name price category description product_picture _destroy]
    )
  end
end
