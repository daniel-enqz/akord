# Presenter for Event Date
class Event::Date
  attr_reader :value

  def initialize(date_string)
    @value = Date.parse(date_string)
  end

  # Example of things the view might need
  # def short_month
  #   value.strftime("%b")
  # end
end