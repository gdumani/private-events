class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in to do that.' if @current.nil?
  end
end
