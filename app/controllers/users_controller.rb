class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @tasks = TaskDetail.where(user_id: session[:user_id])
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = current_user
    end

end
