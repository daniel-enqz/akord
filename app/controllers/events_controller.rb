class EventsController < ApplicationController

  def show
  end
  def join
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.owner = current_user
    authorize @event
    if @event.save
      redirect_to event_path(@event), notice: 'event was successfully created.'
    else
      render :new
    end
  end

  private

  def set_event
    @event = event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :votable_dates_strings)
  end
end
