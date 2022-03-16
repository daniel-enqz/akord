# Presenter for Event Date
class Event::Date
  attr_reader :value, :event

  def initialize(date_string, event)
    @value = Date.parse(date_string)
    @event = event
  end

  # Example of things the view might need
  def short_string
    value.strftime("%b %d")
  end

  def votes
    event.votes.where(date: value)
  end

  def rate
    votes.sum(:rate)
  end

  def yes_count
    votes.where(rate: :yes).count
  end

  def no_count
    votes.where(rate: :no).count
  end

  def maybe_count
    votes.where(rate: :maybe).count
  end
end
