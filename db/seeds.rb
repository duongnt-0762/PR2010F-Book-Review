# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Author.create!(id: 777,
  name: "To Van Ban",
  description: "My favourite Author")

Category.create!(id: 777,
  name: "Toan hoc")

Book.create!(
  name: "Giai tich 2",
  author_id: 777,
  category_id: 777,
  description: "Giang vien HVKTQS")

# Users
User.create!(name: "Nguyen Tien Dat",
  email: "nguyendat@gmail.com",
  role_admin: 1,)
10.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "111111"
  User.create!(name: name,
    email: email,)
end