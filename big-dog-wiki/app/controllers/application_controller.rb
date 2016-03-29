class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception


  # Putting helper methods here and defining "helper_method" makes them accessible to ALL controllers & views

  # def foobarbaz
  #   "<b>Hi</b>"
  # end
  # helper_method :foobarbaz

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user.clearance == "admin"
  end

  # Moved from Users Helper file, notes there
  def authorize
    redirect_to "/login" unless current_user
  end

  helper_method :authorize

  helper_method :current_user
  helper_method :admin?
end
