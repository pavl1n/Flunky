# frozen_string_literal: true

2.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: Faker::PhoneNumber.phone_number, user_type: 0)
end

5.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: Faker::PhoneNumber.phone_number, user_type: 1)
end

5.times do
  @restaurant = User.create(name: Faker::Restaurant.name, city: Faker::Address.city,  phone_number: Faker::PhoneNumber.phone_number, user_type: 2)
end

User.all.restaurant.each do |restaurant|
  @products = restaurant.products.create(name: Faker::Food.dish, price: Faker::Types.rb_integer, category: Faker::Restaurant.type, description: Faker::Food.description)
end

User.all.client.each do |client|
  @orders = client.orders.create(approved: true, status: 1, payment_type: 0)
end
