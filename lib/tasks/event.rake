namespace :event do
  desc "Adds random votes to the last event"
  task random_votes_to_last: :environment do
    # VotesJob.set(wait: 5.seconds).perform_later(@event)
    VotesJob.perform_now(Event.last)
  end

end
