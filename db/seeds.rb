# frozen_string_literal: true

2.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: Faker::PhoneNumber.phone_number, user_type: 0)
end
5.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: Faker::PhoneNumber.phone_number, user_type: 1)
end

5.times do
  User.create(name: Faker::Restaurant.name, city: Faker::Address.city,  phone_number: Faker::PhoneNumber.phone_number, user_type: 2)
end
i = 0
5.times do
  Product.create(user_id: i, name: Faker::Food.dish, price: Faker::Types.rb_integer, category: Faker::Restaurant.type, description: Faker::Food.description)
  i += 1
end
i = 0
5.times do
  Order.create(products_id: i, user_id: i, approved: true, status: 0, payment_type: 0)
  i += 1
end
i = 0
5.times do
  RestaurantOrder.create(order_id: i, users_id: i, approved: true, status: 0)
  i += 1
end
