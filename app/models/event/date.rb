# Presenter for Event Date
class Event::Date
  attr_reader :value, :event

  def initialize(date_string, event)
    @value = Date.parse(date_string)
    @event = event
  end

  def ==(other)
    (value == other.value) && (event == other.event)
  end

  def chosen?
    event.chosen_date == self
  end

  # Example of things the view might need
  def short_string
    value.strftime("%a, %b %d")
  end

  def year
    value.strftime("%Y")
  end

  def week_day
    value.strftime("%a")
  end

  def month
    value.strftime("%b")
  end

  def month_number
    value.strftime("%-m")
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

  def outlook_url
    calendar_url_builder.outlook_com_url
  end

  def google_url
    calendar_url_builder.google_url
  end

  private

  def calendar_url_builder
    @calendar_url_builder ||= AddToCalendar::URLs.new(
      start_datetime: Time.new(year, month_number, day),
      end_datetime: Time.new(year, month_number, day, 23, 59, 59, 0), # required
      title: event.title, # required
      timezone: 'America/Mexico_City', # required
      url: "https://www.akord.me/events/#{event.hashid}",
      description: "Host: #{event.user.attendee.name}🥳\n#{event.description}",
      add_url_to_description: true # defaults to true
    )
  end
end
