class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  #set to a future admin setting, only admin can view this page to see all the users and their tasks --- buggy
  def index
    @users = User.all
    @tasks_responses = []

    @users.each do |user|
      @tasks = TaskDetail.where(:user_id => user.id)
      end

    @tasks.each do |t|
      @tasks_responses << t.response
    end

    @tasks_responses
  end

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
