class Event < ApplicationRecord
  include Hashid::Rails

  belongs_to :user
  has_many :votes

  before_create :generate_fun_id

  attribute :title, :string, default: "Our Event"

  def event_dates
    votable_dates_strings.map { |date_string| Event::Date.new(date_string, self) }
  end

  def dates_rate
    votes.group(:date).sum(:rate)
  end

  # Might help with flatpick values if they are JSON
  def votable_dates_strings=(value)
    value = value.split(", ") if value.is_a? String
    super(value)
  end

  private

  def generate_fun_id
    nouns = %w[goose pancake pie gorilla memory shirt pickle fruit beast house]
    adjectives = %w[pretty funky smelly dirty silly tiny kind huge lovely delighful sweet]
    self.funid = "#{adjectives.sample}-#{nouns.sample}"
  end
end
