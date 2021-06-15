require 'rails_helper'
require 'faker'
RSpec.describe User, type: :model do
  describe 'creating' do
    it "valid admin with valid attributes" do
      subject.name = Faker::Name.name
      subject.city = Faker::Address.city
      subject.phone_number = '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s
      subject.password = Faker::Internet.password(min_length: 6)
      subject.email = Faker::Internet.email
      subject.user_type = 0
      subject.create_stage = 0
      expect(subject).to be_valid
    end

    it "valid client with valid attributes" do
      subject.name = Faker::Name.name
      subject.city = Faker::Address.city
      subject.phone_number = '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s
      subject.password = Faker::Internet.password(min_length: 6)
      subject.email = Faker::Internet.email
      subject.user_type = 1
      subject.create_stage = 1
      expect(subject).to be_valid
    end

    it "valid restaurant with valid attributes" do
      subject.name = Faker::Name.name
      subject.city = Faker::Address.city
      subject.phone_number = '+375' + ['29', '33', '44', '25'].sample + Faker::Number.number(digits: 7).to_s
      subject.password = Faker::Internet.password(min_length: 6)
      subject.email = Faker::Internet.email
      subject.user_type = 2
      subject.create_stage = 2
      subject.street = Faker::Address.street_address
      subject.house_number = Faker::Address.building_number
      subject.avatar.attach(io: File.open("#{Rails.root}/spec/fixtures/1.jpg"), filename: '1.jpg')
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'has many associations', :aggregate_failures do
      expect(restaurant).to have_many(:products)
      expect(restaurant).to have_many(:restaurant_orders)
      expect(client).to have_many(:comments)
    end

    it 'has one associations', :aggregate_failures do
      expect(subject).to have_one(:avatar)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:city)
      expect(subject).to validate_presence_of(:email)
    end
  end
end
