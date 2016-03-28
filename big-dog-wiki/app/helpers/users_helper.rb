module UsersHelper

  def current_user
    @current_user ||=.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to "/login" unless current_user
  end
end
