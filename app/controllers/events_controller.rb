class EventsController < ApplicationController
  before_action :find_event, only: [:edit, :show, :data, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params

    if @event.valid?
      @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  # def destroy
  #   event = Event.find(params[:id])
  #   if event
  #     event.destroy
  #   end
  #   redirect_to users_path
  # end

  def show
    @app_needs_response = @event.applications.needs_admin_response.order(:created_at).all
    @app_has_response = @event.applications.has_admin_response.order(:admin_status, :user_status, :created_at).all
  end

  def data
  end

  # def update
  # end

  private
  def event_params
    params.require(:event).permit(:title, :live)
  end

  def find_event
    @event = Event.find(params[:id] || params[:event_id])
  end
end