# frozen_string_literal: false

# Described product actions
class ProductController < ApplicationController
  def show; end

  def new
    @user = current_user
    @product = current_user.products.build
  end

  def edit; end

  def create
    @product = current_user.products.new(user_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'Product was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = current_user.products.new(params[:id])
    respond_to do |format|
      if @product.update(user_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      products_attributes: %i[name price category description]
    )
  end
end
