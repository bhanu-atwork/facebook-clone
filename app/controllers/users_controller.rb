class UsersController < ApplicationController
  
  def show
    @current_users_posts = @current_user.posts
    @friends = Friend.where(second_user_id: @current_user.id , status: 0)
  end
end
