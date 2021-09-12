class PostsController  < ApplicationController
  
  def create
    @current_user = helpers.current_user
    if !@current_user.posts.build(:id => params[:id], :image => params[:image]).save
      flash[:errors] = @post.errors.full_messages
    end
    redirect_to user_path(@current_user)
  end

  def show
  end

end