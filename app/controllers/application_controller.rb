class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  protected
    def configure_permitted_parameters
      attributes = [:first_name, :last_name, :birth_date, :gender, :contact_number, :email, :password]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end
