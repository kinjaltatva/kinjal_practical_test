class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, if: Proc.new { |c| c.request.format.include? 'application/json'}
  before_action :doorkeeper_authorize!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  private

  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
