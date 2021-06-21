require 'faker'

FactoryBot.define do

  factory :admin, class: 'User' do
      name { Faker::Name.name }
      city { Faker::Address.city }
      phone_number { '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s }
      password { Faker::Internet.password(min_length: 6) }
      email { Faker::Internet.email }
      user_type { 0 }
      create_stage { 1 }
  end

  factory :client, class: 'User' do
      name { Faker::Name.name }
      city { Faker::Address.city }
      phone_number { '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s }
      password { Faker::Internet.password(min_length: 6) }
      email { Faker::Internet.email }
      user_type { 1 }
      create_stage { 1 }
  end

  factory :restaurant, class: 'User' do
      name { Faker::Name.name }
      city { Faker::Address.city }
      phone_number { '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s }
      password { Faker::Internet.password(min_length: 6) }
      email { Faker::Internet.email }
      user_type { 2 }
      create_stage { 2 }
      street { Faker::Address.street_address }
      house_number { Faker::Address.building_number }
      confirmed { false }
      avatar { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/1.jpg", '1.jpg') }

  end
end
