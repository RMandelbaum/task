class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  #allows for iOS compatability
  before_action :check_for_mobile
  helper_method :current_user, :logged_in?, :require_login, :mobile_device?


  private

    #Methods to check sessions and current_user
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    #Must be logged in to fill out forms
    def require_login
      if !session.include? :user_id
         render "sessions/new"
      end
    end

    #Methods to check for iOS
    def check_for_mobile
      session[:mobile_override] = params[:mobile] if params[:mobile]
      prepare_for_mobile if mobile_device?
    end

    def mobile_device?
      if session[:mobile_override]
        session[:mobile_override] == "1"
      end
    end

    def prepare_for_mobile
      prepend_view_path Rails.root + 'app' + 'views_mobile'
    end

end
