require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it 'has many associations', :aggregate_failures do
      expect(subject).to have_many(:restaurant_orders)
      expect(subject).to have_many(:order_positions)
      expect(subject).to have_many(:products)
    end
  end

  describe 'enums' do
    it 'has enums for status' do
      expect(subject).to define_enum_for(:status)
    end

    it 'has enums for payment_type' do
      expect(subject).to define_enum_for(:payment_type)
    end
  end
end
