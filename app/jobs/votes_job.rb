class VotesJob < ApplicationJob
  # Creates random votes for the created event after 30 seconds
  queue_as :default

  def perform(event)
    # valid_rates = Vote.rates.keys
    valid_rates = [
      ['yes', 3],
      ['no', 1],
      ['yes', 1]
    ]

    10.times do
      event.votes.create!(
        date: event.votable_dates.sample,
        rate: valid_rates.sample,
        attendee: Attendee.new(name: Faker::Name.name)
      )
    end
  end
end
