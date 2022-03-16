class Event::DateVotes
  include ActiveModel::Model
  attr_accessor :attendee, :event

  def voted?
    @voted ||= attendee.votes.where(event: event).exists?
  end

  def votes
    @votes ||= voted? ? attendee.votes.where(event: event) : build_votes
  end

  def votes_attributes=(value)
    @votes_attributes = value
  end

  def submit
    attributes = @votes_attributes.transform_values do |value|
      value.merge(attendee: attendee, event: event, rate: value[:rate].to_i)
    end
    Vote.create!(attributes.values)
  end

  private

  def build_votes
    event.votable_dates_strings.map do |date_string|
      Vote.new(event: event, attendee: attendee, date: date_string)
    end
  end
end
