
2.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s, password: Faker::Internet.password(min_length: 6), email: Faker::Internet.email, user_type: 0, create_stage: 0)
end

5.times do
  User.create(name: Faker::Name.name, city: Faker::Address.city, phone_number: '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s, password: Faker::Internet.password(min_length: 6), email: Faker::Internet.email, user_type: 1, create_stage: 1)
end

5.times do
  restaurant = User.new(name: Faker::Name.name, city: Faker::Address.city, phone_number: '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s, password: Faker::Internet.password(min_length: 6), email: Faker::Internet.email, user_type: 2, create_stage: 2, street: Faker::Address.street_address, house_number: Faker::Address.building_number, confirmed: false)
  restaurant.avatar.attach(io: File.open("#{Rails.root}/spec/fixtures/1.jpg"), filename: '1.jpg')
  restaurant.save
end

5.times do
  restaurant = User.new(name: Faker::Name.name, city: Faker::Address.city, phone_number: '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s, password: Faker::Internet.password(min_length: 6), email: Faker::Internet.email, user_type: 2, create_stage: 2, street: Faker::Address.street_address, house_number: Faker::Address.building_number, confirmed: true)
  restaurant.avatar.attach(io: File.open("#{Rails.root}/spec/fixtures/1.jpg"), filename: '1.jpg')
  restaurant.save
end

User.restaurant.each do |restaurant|
  5.times do
    product = restaurant.products.new(name: Faker::Food.dish, price: Faker::Types.rb_integer, category: Faker::Restaurant.type, description: Faker::Food.description[0...100], approved: true)
    product.product_picture.attach(io: File.open("#{Rails.root}/spec/fixtures/3.jpeg"), filename: '3.jpeg')
    product.save
  end
  5.times do
    product = restaurant.products.new(name: Faker::Food.dish, price: Faker::Types.rb_integer, category: Faker::Restaurant.type, description: Faker::Food.description[0...100], approved: false)
    product.product_picture.attach(io: File.open("#{Rails.root}/spec/fixtures/3.jpeg"), filename: '3.jpeg')
    product.save
  end
end
