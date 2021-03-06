class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :login, :logged_in?
  
  def login(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def current_user 
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end  
  
  def require_user!
    redirect_to new_session_url if current_user.nil?
  end
  
  def logged_in?
    !!current_user
  end
   
end
