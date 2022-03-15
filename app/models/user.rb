class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :attendee, optional: true

  after_create :create_attendee

  private

  def create_attendee
    attendee_name = email.gsub(/^(.*?)@.*/, '\1')
    create_attendee!(name: attendee_name)
  end
end
