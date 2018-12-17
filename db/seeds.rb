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
