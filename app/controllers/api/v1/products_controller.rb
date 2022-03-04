# frozen_string_literal: false

module Api
  module V1
    class ProductsController < ApplicationController
      def new
        product = current_user.products.build

        render json: ProductSerializer.new(product).serializable_hash.to_json
      end

      def index
        products = Product.all

        render json: ProductSerializer.new(products).serializable_hash.to_json
      end

      def show
        product = if admin(current_user)
                    User.find(params[:user_id]).products.find(params[:id])
                  else
                    User.find(params[:user_id]).products.approved.find(params[:id])
                  end

        render json: ProductSerializer.new(product).serializable_hash.to_json
      end

      def create
        products_arr = []
        product_params[:products_attributes].each { |_key, value| products_arr << value }
        products_arr.each do |product|
          product = current_user.products.build(product.merge(approved: false))
          next if @product.save

          render json: ProductSerializer.new(product).serializable_hash.to_json
        end
      end

      def update
        product = Product.find(params[:id])
        if @product.update(update_params.merge(approved: false))
          render json: ProductSerializer.new(product).serializable_hash.to_json
        else
          render json: { error: product.errors.messages }, status: 422
        end
      end

      def destroy
        if Product.find(params[:id]).destroy
          head :no_content
        else
          render json: { error: product.errors.messages }, status: 422
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

        render json: { error: product.errors.messages }, status: 403
      end
    end
  end
end
