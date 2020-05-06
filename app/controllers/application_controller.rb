class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :email, :password, :password_confirmation, :avatar, :avatar_cache])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar]) 
    end
end
