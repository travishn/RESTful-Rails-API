class CommentsController < ApplicationController
  def index
    @comments = Comment.where(comment_params)

    render json: @comments
  end
  def create
    @comment = Comment.new(comment_params)
  end


  private
  def comment_params
    if params[:user_id]
      return {user_id: params[:user_id]}
    elsif params[:artwork_id]
      return {artwork_id: params[:artwork_id]}
    else
      return
    end
  end
end
