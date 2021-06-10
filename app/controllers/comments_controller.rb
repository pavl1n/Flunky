class CommentsController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!

  def create
    binding.pry
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
