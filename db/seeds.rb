# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: "sato", 
  email: "sato@gmail.com", 
  password: "aaaaaa",
  password_confirmation: "aaaaaa",
  created_at: "2019-07-11 02:33:34", 
  updated_at: "2019-07-11 02:33:34"
)

