class VotesController < ApplicationController
<<<<<<< HEAD

  def new
  end

=======
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @event = Event.find(params[:event_id])
    @vote = Vote.new
  end

  def create
    @event = Event.find(params[:event_id])
    @vote = Vote.new(vote_params)
    @vote.event = @event
    # @vote.attendee = ??
    if @event.save
      redirect_to event_path(@event), notice: 'event was successfully created.'
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:rate, :date)
  end
>>>>>>> master
end
