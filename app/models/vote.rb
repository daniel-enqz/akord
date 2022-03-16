class Vote < ApplicationRecord
  enum rate: {
    no: -1,
    maybe: 0,
    yes: 1
  }

  belongs_to :event
  belongs_to :attendee
end
