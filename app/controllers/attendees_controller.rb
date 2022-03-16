class AttendeesController < ApplicationController

  # POST /events/:event_id/attendees
  def create
    @attendee = Attendee.new(attendee_params)
  end
end

private

def event_params
  params.require(:attendee).permit(:name)
end
