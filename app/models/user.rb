class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :attendee

  before_validation :generate_attendee

  private

  def generate_attendee
    attendee_name = email.gsub(/^(.*?)@.*/, '\1')
    self.attendee = Attendee.new(name: attendee_name)
  end
end
