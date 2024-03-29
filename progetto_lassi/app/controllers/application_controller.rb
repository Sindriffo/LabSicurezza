class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

  def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome, :cognome, :email, :password, :telefono, :image)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nome, :cognome, :password, :password_confirmation, :current_password, :email, :telefono, :image) }  
  end

	
end
