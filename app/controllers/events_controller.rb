class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show join]
  before_action :set_event, only: %i[show]

  def index
    @events = current_user.events
  end

  def show
  end

  # GET  /e/:funid
  def join
    @event = Event.find_by_funid(params[:funid])
    @attendee = Attendee.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event.hashid), notice: 'event was successfully created.'
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :votable_dates_strings)
  end
end
