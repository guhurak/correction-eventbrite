10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "#{Faker::Lorem.word}@yopmail.com", description: Faker::HitchhikersGuideToTheGalaxy.quote, password: "bonjour")
end

10.times do
  Event.create!(start_date: Faker::Date.forward(50), duration: (5 * rand(1..12)), title: Faker::Creature::Cat.name, description: Faker::HitchhikersGuideToTheGalaxy.quote, price: rand(1..1000), location: Faker::Address.city, user_id: User.all.sample.id )
end

10.times do
  Attendance.create!(stripe_customer_id: SecureRandom.urlsafe_base64, user_id: User.all.sample.id, event_id: Event.all.sample.id)
end
