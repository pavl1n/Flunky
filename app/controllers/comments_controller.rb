# frozen_string_literal: false

# Responsible for commenting products
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Product.find_by_id(params[:product_id]).comments.new(comment_params.merge({ user: current_user }))
    respond_to do |format|
      @comment.save
      ActionCable.server.broadcast 'comments_channel', { content: @comment, user: @comment.user }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :product_id)
  end
end
