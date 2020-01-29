class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, if: Proc.new { |c| c.request.format.include? 'application/json'}
  before_action :doorkeeper_authorize!
end
