class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show join]

  def show
    @event = Event.find(params[:id])

    if @event.closed?
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
