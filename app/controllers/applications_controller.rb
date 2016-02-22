class ApplicationsController < ApplicationController
  before_action :find_application, only: [:edit, :show, :destroy, :update, :update_user_status]
  before_action :assign_admin

  def edit
  end

  def destroy
    event = @application.event
    @application.destroy
    redirect_to event_path(event)
  end

  def show
    @application.comments.build
  end

  def update
    @application.assign_attributes(application_params)

    if @application.admin_status_changed?
      @application.send_admin_status_email
    end

    @application.save
    redirect_to application_path(@application)
  end

  # Left separate from update since it's not for admin
  def update_user_status
    @application.update(user_status: params[:status])
  end

  private
  def find_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.require(:application).permit(Application.allowed_params)
  end

  def assign_admin
    @admin = current_admin
  end
end