# frozen_string_literal: false

# Actions for product model
class ProductsController < ApplicationController
  def new
    @product = current_restaurant.products.new
  end

  def create
    @product = current_restaurant.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to new_product_path, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :category,
      :description,
      :product_picture
    )
  end
end
