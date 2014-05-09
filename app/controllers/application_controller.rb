class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :create_first_admin_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :terms_of_use]
  end

  def create_first_admin_user
    redirect_to new_user_registration_path, notice: 'Please create the first admin user.' if User.count == 0
  end
end
