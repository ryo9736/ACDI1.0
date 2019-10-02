class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters
  
      def resource_name
          :user
      end
  
      def resource
          @resource ||= User.new
      end
  
      def resource_class
          User
      end
  
    def after_sign_in_path_for(resource)
      root_path
     end
  
    def after_sign_out_path_for(resource)
      user_session_path
    end
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
          user_params.permit(:email, :password, :password_confirmation, :admin, :trainer, :trainee)
        end
        devise_parameter_sanitizer.permit(:sign_in) do |user_params|
          user_params.permit(:email, :password, :remember_me)
        end
    end
  end