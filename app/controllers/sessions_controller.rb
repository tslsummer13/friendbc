class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by username: params[:username]

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Signed in successfully.'
      redirect_to root_url
    else
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to new_session_url
    end
  end

  def destroy
  end
end
