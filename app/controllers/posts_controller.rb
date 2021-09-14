class PostsController  < ApplicationController
  
  def create
    @post = @current_user.posts.new(:id: params[:id], :image: params[:image], :body: params[:body])
    flash[:errors] = @post.errors.full_messages unless @post.save
    redirect_to user_path(@current_user)
  end

end