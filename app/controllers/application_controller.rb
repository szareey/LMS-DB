class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :is_approved

 protected
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_approved
    redirect_to :root unless current_user.try(:is_approved?)
  end

  helper_method :current_user
end
