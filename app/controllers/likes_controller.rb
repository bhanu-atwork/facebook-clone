class LikesController < ApplicationController

  def like
    @current_user = helpers.current_user
    @like = Like.new(user_id: @current_user.id, likeable_type: params[:type], likeable_id: params[:id])
    if !@like.save
      flash[:errors] = @like.errors.full_messages
    end
    redirect_to user_path(@current_user)
  end 

  

end
