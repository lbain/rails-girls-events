class EventsController < ApplicationController
  before_action :find_event, only: [:edit, :show]

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
  def event_params
    params.require(:event).permit(:title)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end