User.create!(name: "Harry Potter",
             email: "hpotter@hogwarts.edu",
             password: "quidditch",
             password_confirmation: "quidditch",
             admin: true)

users = RandomuserLocal.generate(50)

users.each do |user|
  name = user[:name][:first].capitalize + " " + user[:name][:last].capitalize
  email = user[:email]
  password = user[:password] + user[:password]
  password_confirmation = password
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation)
end

users = User.order(:created_at).take(6)
50.times do
  name = Faker::Coffee.blend_name + " Cabernet Sauvignon"
  winery = Faker::Beer.hop + " Vineyard and Wine Company"
  vintage = Faker::Date.between(150.years.ago.year, Date.today.year)
  origin = Faker::Nation.capital_city
  price = Faker::Number.between(9, 112)
  rating = Faker::Number.between(1, 10)
  tasting_notes = Faker::Food.fruits + " on the nose, " + "prominent flavors of " + Faker::Coffee.notes
  users.each { |user| user.wines.create!(user_id: user.id,
                                         name: name,
                                         winery: winery,
                                         vintage: vintage,
                                         origin: origin,
                                         price: price,
                                         rating: rating,
                                         tasting_notes: tasting_notes) }
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
