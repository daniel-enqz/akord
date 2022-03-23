class VotesJob < ApplicationJob
  # Creates random votes for the created event after 30 seconds
  queue_as :default

  def perform(event)
    valid_rates = %i[yes yes yes yes yes maybe maybe no no no]

    10.times do
      sleep rand(0.5..1.5)
      attendee = Attendee.create(name: Faker::Name.name)
      first_vote = true
      votes = event.votable_dates.map do |votable_date|
        vote_rate = first_vote ? :yes : valid_rates.sample
        first_vote = false
        event.votes.create!(
          date: votable_date,
          rate: vote_rate,
          attendee: attendee
        )
      end
      EventChannel.broadcast_to(
        event,
        votes.as_json(only: [:date, :rate])
      )
    end
  end
end
