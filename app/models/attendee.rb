class Attendee < ApplicationRecord
  has_one :user

  def visitor?
    user.blank?
  end
end
