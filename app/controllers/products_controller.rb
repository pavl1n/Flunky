# frozen_string_literal: false

# Actions for product model
class ProductsController < ApplicationController
  def new; end

  def create
    #@user = current_user
    respond_to do |format|
      binding.pry
      if current_user.update(product_params)
        format.html { render :new, notice: 'Product was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def product_params
    params.require(:user).permit(
      products_attributes: %i[id name price category description _destroy product_picture]
    )
  end
end
