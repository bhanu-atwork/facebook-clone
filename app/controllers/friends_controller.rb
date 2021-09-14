class FriendsController < ApplicationController
  
  def show
    @current_user = helpers.current_user
    @friend_requests = Friend.where(second_user_id: @current_user.id, status: 2)
  end

  def create
    @current_user = helpers.current_user
    @friend_request = Friend.new(first_user_id: @current_user.id, second_user_id: params["friend_id"], status: 2)
    if !@friend_request.save
      flash[:errors] = @friend_request.errors.full_messages
    end
    redirect_to friend_path(@current_user.id)
  end

  def update
    @current_user = helpers.current_user
    @friend = Friend.find_by(first_user_id: params["friend_id"].to_i, second_user_id: @current_user.id)
    if !@friend.update(status: params["status"].to_i)
      flash[:errors] = @friend_status.errors.full_messages
    end
    redirect_to friend_path(@current_user.id)
  end
end