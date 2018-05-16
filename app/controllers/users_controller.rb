class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  # skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def show
    @tasks = TaskDetail.where(user_id: session[:user_id])
    
  end

  def edit
  end

  def update
    @user.update(user_params)

    redirect_to user_path(@user)
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end


    def set_user
      @user = current_user
    end

end
