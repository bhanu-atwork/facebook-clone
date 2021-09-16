class UsersController < ApplicationController
    
  helper_method :friend_name
  def show
    @current_users_posts = [current_user.posts]
    @friends = Friend.where(second_user_id: @current_user.id , status: 0).or(
      Friend.where(first_user_id: @current_user.id , status: 0))
    @friends.each do |friend|
      @first_user = User.find_by(id: friend.first_user_id) if friend.second_user_id == @current_user.id
      @current_users_posts.push(@first_user.posts) unless @first_user.nil?
      @second_user = User.find_by(id: friend.second_user_id) if friend.first_user_id == @current_user.id
      @current_users_posts.push(@second_user.posts) unless @second_user.nil?
    end
    @current_users_posts = @current_users_posts.flatten
  end

  def friend_name(friend)
    if friend.first_user_id == @current_user.id
      User.find(friend.second_user_id).first_name
    else
      User.find(friend.first_user_id).first_name
    end
  end

end
