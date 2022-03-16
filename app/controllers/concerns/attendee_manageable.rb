module AttendeeManageable
  extend ActiveSupport::Concern

  included do
    before_action :current_attendee
  end

  private

  def current_attendee
    @current_attendee ||= Attendee.find_by(id: session[:attendee_id])
  end

  def assign_session_attendee(attendee)
    session[:attendee_id] = attendee.id
  end
end
