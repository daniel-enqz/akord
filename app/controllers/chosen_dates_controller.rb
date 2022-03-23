class ChosenDatesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.update(chosen_date: params[:date_string])
    redirect_to event_chosen_date_path(@event)
  end

  def show
    @event = Event.find(params[:event_id])
  end
end
