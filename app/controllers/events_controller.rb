class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show join]

  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  # GET  /e/:funid
  # GET  /e?funid=
  def join
    @event = Event.find_by_funid!(params[:funid])
    redirect_to new_event_date_vote_path(@event) if current_attendee.present?

    @attendee = Attendee.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event.hashid), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :votable_dates_strings)
  end
end
