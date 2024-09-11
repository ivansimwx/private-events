class EventsController < ApplicationController
  # before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all
  end

  private
  def event_params
    params.require(:event).permit(:name, :desc)
  end
end
