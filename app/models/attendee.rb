class Attendee < ApplicationRecord
  has_one :user
  has_many :votes

  def visitor?
    user.blank?
  end


end
