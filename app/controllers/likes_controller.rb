class LikesController < ApplicationController

  def create
    @like = @current_user.likes.build(likeable_type: params["type"], likeable_id: params["id"])
    payload = {"error": nil}
    status_code = :ok
    unless @like.save
      payload["error"] = @like.errors.full_messages
      status_code = :internal_server_error 
    end
    payload["current_likes_count"] = Like.where(likeable_type: params["type"], likeable_id: params["id"]).count
    render json: payload, status: status_code
  end 

  def destroy
    like_condition_map = { user_id: @current_user.id, likeable_type: params["type"], likeable_id: params["id"] }
    @like = Like.find_by(like_condition_map)
    payload = {"error": nil}
    status_code = :ok
    if @like.nil?
      payload["error"] = "No Data Like Found"
      status_code = :internal_server_error 
    else
      @like.destroy
    end
    payload["current_likes_count"] = Like.where(likeable_type: params["type"], likeable_id: params["id"]).count
    render json: payload, status: status_code
  end
end
