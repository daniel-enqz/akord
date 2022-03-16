class AttendeesController < ApplicationController

  # POST /events/:event_id/attendees
  def create
    @event = Event.find(params[:event_id])
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      session[:attendee_id] = @attendee.id
      redirect_to new_event_vote_path(@event)
    else
      render "events/join"
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name)
  end
end
