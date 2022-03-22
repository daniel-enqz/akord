# Presenter for Event Date
class Event::Date
  attr_reader :value, :event

  def initialize(date_string, event)
    @value = Date.parse(date_string)
    @event = event
  end

  # Example of things the view might need
  def short_string
    value.strftime("%A, %b %d")
  end

  def week_day
    value.strftime("%A")
  end

  def month
    value.strftime("%b")
  end

  def day
    value.strftime("%d")
  end

  def votes
    event.votes.where(date: value)
  end

  def rate
    votes.sum(:rate)
  end

  def total_votes
    votes.count
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

  def progress_bar_value
    total_votes.zero? ? 0 : (yes_count * 100) / total_votes
  end

  def limt_three_voters
    i = 0
    while i < 3
      event_date.votes[i].attendee.name
      i += 1
    end
  end

  def to_partial_path
    "event_date"
  end
end
