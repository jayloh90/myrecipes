class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in? # with this it is available everywhere even the views. 
  #without this, methods in Application Controller are available only in controllers
  
  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id] # ||= is memoization is used storing results of expensive function calls
    #@current_user = @current_user || Chef.find(session[:chef_id]) if session[:chef_id]. 
    #That means that you’ll only make the network call the first time you
    #call current_user, and future calls will just return the value of the instance variable @current_user.
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to :back
    end
  end
  
end