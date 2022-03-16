user1 = User.create!(email: "user@user.com", password: 123456)
valid_rates = Vote.rates.keys

next_three_days = [Date.current, Date.current + 1, Date.current + 2]
event1 = Event.create!(
  title: "Le Wagon - Assado",
  description: "Assado at Le Wagon",
  user: user1,
  votable_dates_strings: next_three_days
)

10.times do
  next_three_days.each do |date|
    event1.votes.create!(
      date: date,
      rate: valid_rates.sample,
      attendee: Attendee.new(name: Faker::Name.name)
    )
  end
end
