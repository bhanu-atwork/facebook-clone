class CommentsController < ApplicationController

  def create
    @current_user = helpers.current_user
    @comment = @current_user.comments.new(:body=> params[:comment_body], :post_id => params[:post_id])
    if !@comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to user_path(@current_user)
  end

end