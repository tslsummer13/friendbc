class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def set_user
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    user_params = {
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      facebook_access_token: params[:facebook_access_token],
      facebook_id: params[:facebook_id]
    }

    @user = User.new(user_params)

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.username = params[:username]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.facebook_access_token = params[:facebook_access_token]
    @user.facebook_id = params[:facebook_id]

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end
end
