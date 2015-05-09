class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :assign_current_user
  def assign_current_user 
    @current_user = Admin.first
  end
end
