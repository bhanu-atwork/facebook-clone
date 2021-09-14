class LikesController < ApplicationController

  def create
    @like = @current_user.likes.build(likeable_type: params["type"], likeable_id: params["id"])
    flash[:errors] = @like.errors.full_messages unless @like.save
    redirect_to user_path(@current_user)
  end 

  def destroy
    like_condition_map = { user_id: @current_user.id, likeable_type: params["type"], likeable_id: params["id"] }
    Like.destroy_by(like_condition_map)
  end
end
