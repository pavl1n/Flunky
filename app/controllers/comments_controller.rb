# frozen_string_literal: false

# Responsible for commenting products
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Product.find_by_id(params[:product_id]).comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :product_id)
  end
end
