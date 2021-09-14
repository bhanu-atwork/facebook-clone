class UsersController < ApplicationController
  
  def show
    @current_users_posts = @current_user.posts
  end
end
