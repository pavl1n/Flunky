# frozen_string_literal: false

# Responsible for commenting products
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Product.find_by_id(params[:product_id]).comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        ActionCable.server.broadcast 'comments_channel', { content: @comment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :product_id)
  end
end
