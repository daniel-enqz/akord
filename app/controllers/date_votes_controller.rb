class DateVotesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    event = Event.find(params[:event_id])
    attendee = current_attendee
    @date_votes = Event::DateVotes.new(attendee: attendee, event: event)

    redirect_to join_event_path(event.hashid) unless attendee.present?
    redirect_to event, alert: "You already voted!" if @date_votes.voted?
  end

  def create
    @event = Event.find(params[:event_id])
    @attendee = current_attendee
    @date_votes = Event::DateVotes.new(date_votes_params)
    if @date_votes.submit
      VotesChannel.broadcast_to(
        @event,
        @date_votes.votes.as_json(only: [:date, :rate])
      )
      redirect_to event_path(@event.hashid), notice: 'Your vote is in, Thanks!'
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def date_votes_params
    params.require(:event_date_votes).permit(votes_attributes: [:rate, :date]).merge(event: @event, attendee: @attendee)
  end
end
