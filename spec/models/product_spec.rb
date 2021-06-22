require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it 'belongs_to associations', :aggregate_failures do
      expect(subject).to belong_to(:restaurant)
    end

    it 'has many associations', :aggregate_failures do
      expect(subject).to have_many(:order_positions)
      expect(subject).to have_many(:comments)
      expect(subject).to have_many(:orders)
    end

    it 'has one attached' do
      expect(subject).to have_one_attached(:product_picture)
    end
  end

  describe 'nested attributes' do
    it 'has childs' do
      expect(subject).to accept_nested_attributes_for(:comments)
    end
  end

  describe 'validations' do
    it 'presence validations', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:price)
      expect(subject).to validate_presence_of(:category)
      expect(subject).to validate_presence_of(:description)
    end

    it 'numericality validations' do
      expect(subject).to validate_numericality_of(:price)
    end

    it 'length validations' do
      expect(subject).to validate_length_of(:price)
    end
  end

  describe 'product picture attached' do
    it 'has no picture' do
      subject = create(:client)
      expect(subject.avatar).not_to be_attached
    end
  end
end
