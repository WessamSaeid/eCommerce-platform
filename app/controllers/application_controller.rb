class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :email, :password, :password_confirmation, :avatar, :avatar_cache])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar]) 
    end

    #
    # redirect registered users to a profile page
    # of to the admin dashboard if the user is an administrator
    #
    def after_sign_in_path_for(resource)
        resource.role == 'admin' ? admin_dashboard_path : root_path
    end

    def authenticate_admin_user!
        raise SecurityError unless current_user.try(:role) == 'admin'
    end

    rescue_from SecurityError do |exception|
        redirect_to root_path
    end
end
