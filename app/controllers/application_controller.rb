class ApplicationController < ActionController::Base
  protect_from_forgery

  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Sorry. You may not alter another users content."
    flash.keep(:notice)
    redirect_to root_url
  end

 protect_from_forgery with: :exception
 # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :full_name, :current_city, :image) }
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :full_name, :current_city, :image) }
      end


  def home
    render 'cities/home'
  end


end

