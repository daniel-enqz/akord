class ChosenDatesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.update(chosen_date: params[:date_string])

    EventStatusChannel.broadcast_to(
      @event,
      {
        dates: render_to_string(partial: "events/event_date", collection: @event.event_dates),
        info: render_to_string(partial: "chosen_dates/modal", locals: { event: @event }),
        alertWindow: render_to_string(partial: "chosen_dates/alert_window", locals: { event: @event })
      }
    )
    redirect_to event_chosen_date_path(@event)
  end

  def show
    @event = Event.find(params[:event_id])
  end
end
