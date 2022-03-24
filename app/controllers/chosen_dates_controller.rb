class ChosenDatesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.update(chosen_date: params[:date_string])
    redirect_to event_chosen_date_path(@event)
  end

  def show
    @event = Event.find(params[:event_id])

    @cal = AddToCalendar::URLs.new(
      start_datetime: Time.new(@event.chosen_date.year, @event.chosen_date.month_number, @event.chosen_date.day),
      end_datetime: Time.new(@event.chosen_date.year, @event.chosen_date.month_number, @event.chosen_date.day, 23, 59, 59, 0), # required
      title: "#{@event.title}", # required
      timezone: 'America/Mexico_City', # required
      url: "https://www.akord.me/events/#{@event.hashid}",
      description: "Host: #{@event.user.attendee.name}🥳\n#{@event.description}",
      add_url_to_description: true # defaults to true
    )
  end
end
