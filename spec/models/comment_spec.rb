require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'belongs_to associations', :aggregate_failures do
      expect(subject).to belong_to(:user)
      expect(subject).to belong_to(:product)
    end
  end

  describe 'validations' do
    it 'presence validations', :aggregate_failures do
      expect(subject).to validate_presence_of(:body)
    end
  end
end
