class CommentsController < ApplicationController

  def create
    @comment = @current_user.comments.build(comment_params)
    flash[:errors] = @comment.errors.full_messages unless @comment.save
    redirect_to user_path(@current_user)
  end

  private
  def comment_params
    params.permit(:body, :post_id)
  end

end