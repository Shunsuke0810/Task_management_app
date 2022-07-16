# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  id: 1,
  name: "admin", 
  email: "admin@admin.com", 
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  admin: true
)

User.create(
  id: 2,
  name: "a", 
  email: "a@a.com", 
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  admin: false
)

User.create(
  id: 3,
  name: "b", 
  email: "b@b.com", 
  password: "bbbbbb",
  password_confirmation: "bbbbbb",
  admin: false
)

Task.create(
  title: "aのタスク",
  content: "a",
  created_at: "2022-07-16",
  updated_at: "2022-07-16",
  period: "2022-07-19",
  status: 1,
  priority: 1,
  user_id: 2
)

Task.create(
  title: "bのタスク",
  content: "b",
  created_at: "2022-07-17",
  updated_at: "2022-07-17",
  period: "2022-07-20",
  status: 2,
  priority: 2,
  user_id: 3
)



