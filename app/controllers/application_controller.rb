class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_character

  private

  def layout_by_resource
    if user_signed_in?
      'application'
    else
      'auth'
    end
  end

  def after_sign_in_path_for(resource)
    resource.character ? dashboard_path : new_character_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def current_character
    @current_character ||= current_user.character
  end
end
