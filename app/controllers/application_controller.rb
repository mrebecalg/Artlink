class ApplicationController < ActionController::Base
  # Redirige después del inicio de sesión
  def after_sign_in_path_for(resource)
    root_path
  end

  # Redirige después del cierre de sesión
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  
end
