class CommentsController < ApplicationController

  def create
    @comment = @current_user.comments.build(body: params[:comment_body], post_id: params[:post_id])
    flash[:errors] = @comment.errors.full_messages unless @comment.save
    redirect_to user_path(@current_user)
  end

end