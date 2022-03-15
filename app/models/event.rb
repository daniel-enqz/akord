class Event < ApplicationRecord
  belongs_to :user

  def votable_dates
    votable_dates_strings.map { |date_string| Event::Date.new(date_string) }
  end

  # Might help with flatpick values if they are JSON
  def votable_dates_strings=(value)
    value = value.split(", ") if value.is_a? String
    super(value)
  end
end
