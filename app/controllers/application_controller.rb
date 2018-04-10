class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  attr_writer :current_user
  helper_method :current_user, :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      session[:return_to] = request.url
      redirect_to login_path, alert: helpers.alert_message(:login)
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
