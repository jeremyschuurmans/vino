User.create!(name: "Harry Potter",
             email: "hpotter@hogwarts.edu",
             password: "quidditch",
             password_confirmation: "quidditch",
             admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "student-#{n+1}@hogwarts.edu"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  name = Faker::Lorem.sentence
  winery = Faker::Lorem.sentence
  vintage = Faker::Lorem.sentence
  origin = Faker::Lorem.sentence
  price = Faker::Lorem.sentence
  rating = Faker::Lorem.sentence
  tasting_notes = Faker::Lorem.sentence
  users.each { |user| user.wines.create!(name: name,
                                         winery: winery,
                                         vintage: vintage,
                                         origin: origin,
                                         price: price,
                                         rating: rating,
                                         tasting_notes: tasting_notes) }
end
