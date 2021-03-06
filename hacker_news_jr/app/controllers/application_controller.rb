class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user
  # skip_before_action :require_logged_in, only: [:new, :create]

  #don't like this since it makes things take too long,
  #things work with it for now, need to change later
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_authenticated?
    !!session[:user_id]
  end

  def require_logged_in
    redirect_to login_path unless is_authenticated?
  end

end
