class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
  #protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token


  # before_action :require_login
  # skip_before_action :require_login, only: "category/index"

  helper_method :current_user, :logged_in?



  private

    def current_user
      @current_user = User.find_by(id: session[:user_id])

    end

    def logged_in?
      !!current_user
    end


end
