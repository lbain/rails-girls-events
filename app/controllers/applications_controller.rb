class ApplicationsController < ApplicationController
  before_action :find_application, only: [:edit, :show, :destroy]

  def edit
  end

  # def destroy
  #   event = Event.find(params[:id])
  #   if event
  #     event.destroy
  #   end
  #   redirect_to users_path
  # end

  def show
  end

  # def update
  # end

  private
  def find_application
    @application = Application.find(params[:id])
  end
end