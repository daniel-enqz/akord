class Vote < ApplicationRecord
  enum rate: {
    no: -1,
    maybe: 0,
    yes: 1
  }

  belongs_to :event
  belongs_to :attendee


  attribute :rate, :integer, default: 0

  def event_date
    Event::Date.new(date_before_type_cast, event)
  end
end
