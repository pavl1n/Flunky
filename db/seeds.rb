
2.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s, password: Faker::Internet.password(min_length: 6), email: Faker::Internet.email, user_type: 0, create_stage: 0)
end

5.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s, password: Faker::Internet.password(min_length: 6), email: Faker::Internet.email, user_type: 1, create_stage: 1)
end

10.times do
  User.new(name: Faker::Name.name, city: Faker::Address.city, phone_number: '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s, password: Faker::Internet.password(min_length: 6), email: Faker::Internet.email, user_type: 2, create_stage: 2, street: Faker::Address.street_address, house_number: Faker::Address.building_number)
end

User.restaurant.each do |restaurant|
  @products = restaurant.products.create(name: Faker::Food.dish, price: Faker::Types.rb_integer, category: Faker::Restaurant.type, description: Faker::Food.description)
end

User.client.each do |client|
  client.orders.create(approved: true, status: 1, payment_type: 0)
end
