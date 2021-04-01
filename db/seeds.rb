# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, email: Faker::Internet.email, password: Faker::Internet.password, phone_number: Faker::PhoneNumber.phone_number, login_status: 'login', user_type: 0)
end
5.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, email: Faker::Internet.email, password: Faker::Internet.password, phone_number: Faker::PhoneNumber.phone_number, login_status: 'login', user_type: 1)
end

5.times do
  User.create(name: Faker::Restaurant.name, city: Faker::Address.city, email: Faker::Internet.email, password: Faker::Internet.password, phone_number: Faker::PhoneNumber.phone_number, login_status: 'login', user_type: 2)
end

5.times do
  Product.create(restaurant_id: User.where(user_type: 'restaurant'), name: Faker::Food.dish, price: Faker::Types.rb_integer, category: Faker::Restaurant.type, description: Faker::Food.description)
end
