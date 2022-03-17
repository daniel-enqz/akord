class Attendee < ApplicationRecord
  has_one :user
  has_many :votes

  validates :name, presence: true

  def visitor?
    user.blank?
  end
end
