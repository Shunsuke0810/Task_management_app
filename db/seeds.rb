# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
User.create(
  id: n + 2,
  name: "name#{n + 1}",
  email: "#{n + 1}@gmail.com",
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  admin: false
)
end

10.times do |n|
Task.create(
  id: n + 1,
  title: "#{n + 1}",
  content: "task",
  created_at: "2022-07-16",
  updated_at: "2022-07-16",
  period: "2022-07-19",
  status: 1,
  priority: 1,
  user_id: n + 1
)
end

10.times do |n|
Label.create(
  name: "Label_#{n + 1}",
  created_at: "2022-07-17",
  updated_at: "2022-07-17",
)
end



