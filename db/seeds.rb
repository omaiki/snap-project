require 'faker'

5.times do
  User.create(
    username: Faker::Team.creature,
    email: Faker::Internet.email,
    password: "123"
    )
end

5.times do
  Video.create(
    url: Faker::Internet.url
    )
end

5.times do
  Snapshot.create(
    file_path: Faker::File.file_name('path/to')
    )
end