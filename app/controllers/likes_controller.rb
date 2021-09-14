class LikesController < ApplicationController

  def like
    @current_user = helpers.current_user
    like_condition_map = { user_id: @current_user.id, likeable_type: params[:type], likeable_id: params[:id] }
    if Like.find_by(like_condition_map)
      Like.destroy_by(like_condition_map)
    else 
      @like = Like.new(user_id: @current_user.id, likeable_type: params[:type], likeable_id: params[:id])
      if !@like.save
        flash[:errors] = @like.errors.full_messages
      end
    end
    redirect_to user_path(@current_user)
  end 

end
