class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :get_user, only: [:create]
  
  def new
  end

  def create
    if @user.password.eql?(session_params[:password])
      session[:user_id] = @user.id
      return redirect_to @user
    else
      flash[:password_notice] = "Please enter correct password"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to new_session_path
  end

  private
    def get_user
      @user = User.find_by(email: session_params[:email])
      if !@user
        flash[:email_notice] = "Your user is not connected to facebook"
        redirect_to new_session_path
      end
    end

  private
    def session_params
      params.permit(:email, :password)
    end
end
