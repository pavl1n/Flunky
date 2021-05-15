class ProductController < ApplicationController
  def create
    @product = current_restaurant.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path }
      else
        format.html { render action: :create }
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      :category,
      :description
    )
  end
end
