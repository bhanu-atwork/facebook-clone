class PostsController  < ApplicationController
  
  def create
    @current_user = helpers.current_user
    @post = @current_user.posts.new(:id => params[:id], :image => params[:image], :body => params[:body])
    if !@post.save
      flash[:errors] = @post.errors.full_messages
    end
    redirect_to user_path(@current_user)
  end

  def show
  end

end