class Event < ApplicationRecord
  include Hashid::Rails

  belongs_to :user
  has_many :votes

  before_create :generate_fun_id

  attribute :title, :string, default: "Our Event"
  validates :title, presence: true

  validate :votable_date_before_today

  def event_dates
    votable_dates_strings.map { |date_string| Event::Date.new(date_string, self) }
  end

  def dates_rate
    votes.group(:date).sum(:rate)
  end

  # Might help with flatpick values if they are JSON
  # "2020-10-10, 2020-10-11" => ["2020-10-10", "2020-10-11"]
  def votable_dates_strings=(value)
    value = value.split(", ") if value.is_a? String
    super(value)
  end

  def votable_dates
    votable_dates_strings.map { |ds| ::Date.parse(ds) }
  end

  private
  
  def generate_fun_id
    nouns = %w[goose pancake pie gorilla memory shirt pickle fruit beast house]
    adjectives = %w[pretty funky smelly dirty silly tiny kind huge lovely delighful sweet]
    self.funid = "#{adjectives.sample}-#{nouns.sample}"
  end
  def votable_date_before_today
    errors.add(:votable_dates_strings, "Cannot select past dates") if any_past_dates?
  end

  def any_past_dates?
    votable_dates.any? { |date| date < ::Date.current }

  end
end
