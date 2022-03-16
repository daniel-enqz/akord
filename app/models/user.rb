class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :attendee, optional: true
  has_many :events
  after_create :create_attendee

  def owns?(event)
    event.user == self
  end
  private

  def create_attendee
    attendee_name = email.gsub(/^(.*?)@.*/, '\1')
    create_attendee!(name: attendee_name)
  end

end
