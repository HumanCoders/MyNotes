class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def authenticate_admin_user!
    redirect_to(new_user_session_path) unless current_user.try(:admin?)
    authenticate_user!
  end

  def current_admin_user
    return nil unless current_user.try(:admin?)
    current_user
  end

end
