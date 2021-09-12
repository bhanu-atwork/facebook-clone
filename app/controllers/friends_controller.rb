class FriendsController < ApplicationController
  def show
    @friend_requests = Friend.where.not(first_user_id: :id)
  end

  def new
  end

end