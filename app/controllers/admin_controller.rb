class AdminController < ApplicationController

  private
  def admin_params
      params.permit(:username, :email)
  end
end
