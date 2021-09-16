class FriendsController < ApplicationController
  
  def show
    @friend_requests = Friend.where(second_user_id: @current_user.id, status: 2)
  end

  def create
    @friend_request = Friend.new(first_user_id: @current_user.id, second_user_id: params["friend_id"], status: 2)
    flash[:errors] = @friend_request.errors.full_messages unless @friend_request.save
    redirect_to friend_path(@current_user.id)
  end

  def update
    @friend = Friend.find_by(first_user_id: params["friend_id"], second_user_id: @current_user.id)
    flash[:errors] = @friend.errors.full_messages  unless @friend.nil? && @friend.update(status: params["status"].to_i)
    redirect_to friend_path(@current_user.id)
  end
end