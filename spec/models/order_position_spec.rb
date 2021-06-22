require 'rails_helper'

RSpec.describe OrderPosition, type: :model do
  describe 'associations' do
    it 'belongs_to associations', :aggregate_failures do
      expect(subject).to belong_to(:product)
      expect(subject).to belong_to(:order)
    end
  end
end
