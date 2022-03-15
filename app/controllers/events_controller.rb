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
    @event.user = current_user
    if @event.save
      redirect_to root_path, notice: 'event was successfully created.'
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
