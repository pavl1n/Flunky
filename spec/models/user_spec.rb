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

    it "valid subject with valid attributes" do
      subject = create(:client)
      expect(subject).to be_valid
    end

    it "valid restaurant with valid attributes" do
      subject = create(:restaurant)
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'has many associations', :aggregate_failures do
      expect(subject).to have_many(:products)
      expect(subject).to have_many(:restaurant_orders)
      expect(subject).to have_many(:comments)
    end

    it 'has one attached', :aggregate_failures do
      expect(subject).to have_one_attached(:avatar)
    end
  end

  describe 'nested attributes' do
    it 'has childs', :aggregate_failures do
      expect(subject).to accept_nested_attributes_for(:comments)
      expect(subject).to accept_nested_attributes_for(:products)
    end
  end

  describe 'avatar attached' do
    it 'has avatar' do
      subject = create(:restaurant)
      expect(subject.avatar).to be_attached
    end

    it 'has no avatar' do
      subject = create(:client)
      expect(subject.avatar).not_to be_attached
    end
  end

  describe '.from_omniauth' do
    let(:auth) do
      OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '100000000000000000000',
        info: {
          email: 'john@example.com',
          name: 'John Smith',
          first_name: 'John',
          last_name: 'Smith'
        }
      )
    end

    it 'creates or updates user from oath hash' do
      user = described_class.from_omniauth(auth)
      expect(auth.provider).to eq('google_oauth2')
      expect(auth.uid).to eq('100000000000000000000')
      expect(user.email).to eq('john@example.com')
      expect(user.name).to eq('John Smith')
    end
  end

  describe 'all_contact_info_filled?' do
    it 'checks is all info filled' do
      subject = create(:client)
      expect(true).to eq(subject.all_contact_info_filled?)
    end

    it 'false if smth not filled' do
      subject = create(:client)
      subject.name = nil
      expect(false).to eq(subject.all_contact_info_filled?)
    end
  end

  describe 'address converter' do
    let(:city) do
      'Baranovichi'
    end
    let(:street) do
      'Vaskina'
    end
    let(:house_number) do
      '12'
    end

    it 'converts city, street, house_number into address' do
      subject.city = city
      subject.street = street
      subject.house_number = house_number
      expect(subject.address).to eq('Baranovichi, Vaskina 12')
    end
  end

  describe 'restaurant_products finder' do
    let(:restaurant) do
      create(:restaurant)
    end
  end
end
