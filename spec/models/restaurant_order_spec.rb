require 'rails_helper'

RSpec.describe RestaurantOrder, type: :model do

  describe 'associations' do
    it 'belongs_to associations', :aggregate_failures do
      expect(subject).to belong_to(:order)
      expect(subject).to belong_to(:restaurant)
    end
  end

  describe 'enums' do
    it 'has enums for status' do
      expect(subject).to define_enum_for(:status)
    end
  end

  describe 'find products name and quantity' do
    it 'finds name' do
      # Когда замержу sql
    end

    it 'finds quantity' do
      # Когда замержу sql
    end
  end
end
