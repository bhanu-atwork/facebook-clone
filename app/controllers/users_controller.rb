class UsersController < ApplicationController
  
  def show
    @current_user = helpers.current_user
    @current_users_posts = @current_user.posts
  end
end
