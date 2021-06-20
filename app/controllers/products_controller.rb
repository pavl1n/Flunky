# frozen_string_literal: false

# Actions for product model
class ProductsController < ApplicationController
  before_action :product_policy, only: %i[edit update]
  def new
    @product = current_user.products.build
  end

  def edit
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(update_params.merge(approved: false))
        format.html { redirect_to dishes_user_index_path, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
    @product = if admin(current_user)
                 User.find(params[:user_id]).products.find(params[:id])
               else
                 User.find(params[:user_id]).products.approved.find(params[:id])
               end
    @comment = Comment.new
    @comments = @product.comments.order('created_at DESC').includes([:user])
  end

  def create
    products_arr = []
    product_params[:products_attributes].each { |_key, value| products_arr << value }
    respond_to do |format|
      products_arr.each do |product|
        @product = current_user.products.build(product.merge(approved: false))
        next if @product.save

        format.html { render :new }
      end
      format.html { redirect_to root_path, notice: 'Products was successfully created.' }
    end
  end

  def destroy
    respond_to do |format|
      if Product.find(params[:id]).destroy
        format.html { render dishes_user_index_path, notice: 'Product was successfully destroyed.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def update_params
    params.require(:product).permit(
      :name, :price, :category, :description, :product_picture
    )
  end

  def product_params
    params.require(:user).permit(
      products_attributes: %i[name price category description product_picture]
    )
  end

  def product_policy
    return if ProductPolicy.new(current_user: current_user, resource: Product.find(params[:id])).able_to_edit?

    redirect_to '/403'
  end
end
