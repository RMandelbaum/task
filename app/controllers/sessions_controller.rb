class SessionsController < ApplicationController

  def new
    @user = User.new
  end

#Authenticates User/Logs user in
  def create
       @user = User.find_by(username: params[:session][:username])
       if @user && @user.authenticate(params[:session][:password])
         session[:user_id] = @user.id
         redirect_to root_path
       else
         render 'new'
       end
   end

#Logs user out
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end




end
