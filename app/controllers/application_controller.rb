class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, if: Proc.new { |c| c.request.format.include? 'application/json'}
  before_action :doorkeeper_authorize!

  private

  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
