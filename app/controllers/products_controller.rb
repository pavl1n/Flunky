# frozen_string_literal: false

# Actions for product model
class ProductsController < ApplicationController
  def new
    @skip_footer = true
    @product = current_user.products.build
  end

  def create
    products_arr = []
    product_params[:products_attributes].each { |_key, value| products_arr << value }
    respond_to do |format|
      products_arr.each do |product|
        @product = current_user.products.build(product)
        next if @product.save

        format.html { render :new }
      end
      format.html { redirect_to root_path, notice: 'Products was successfully created.' }
    end
  end

  private

  def product_params
    params.require(:user).permit(
      products_attributes: %i[name price category description product_picture]
    )
  end
end
