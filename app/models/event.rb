class Event < ApplicationRecord
  belongs_to :user
  has_many :votes

  attribute :title, :string, default: "Our Event"

  def event_dates
    votable_dates_strings.map { |date_string| Event::Date.new(date_string, self) }
  end

  def dates_rate
    votes.group(:date).sum(:rate)
  end

  # Might help with flatpick values if they are JSON
  def votable_dates_strings=(value)
    value = value.split(", ") if value.is_a? String
    super(value)
  end
end
