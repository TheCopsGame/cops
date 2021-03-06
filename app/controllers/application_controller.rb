class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :force_character_creation, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :check_level_progression, unless: :devise_controller?

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
    character = current_user&.character
    @current_character ||= character&.persisted? ? character : nil
  end

  def redirect_with_message(path:, kind:, message:)
    flash[kind] = message
    redirect_to path
  end

  def check_level_progression
    Cops::Level::ProgressionService.call(current_character)
  end

  def visiting_allowed_paths?
    [destroy_user_session_path, new_character_path, characters_path].include?(request.path)
  end

  def force_character_creation
    return if visiting_allowed_paths? || current_character

    redirect_to new_character_path
  end
end
