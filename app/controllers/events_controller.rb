class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_event, only: [:show]

  def new
    @event = current_user.created_events.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all
  end

  def show
    # The @event instance variable is set by the set_event method
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :desc, :date)
  end
end
