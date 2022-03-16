class AttendeesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create]
  # POST /events/:event_id/attendees
  def create
    @event = Event.find(params[:event_id])
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      assign_session_attendee(@attendee)
      redirect_to new_event_date_vote_path
    else
      render "events/join"
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name)
  end
end
