require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'validations' do
    it 'presence validations', :aggregate_failures do
      expect(subject).to validate_presence_of(:email)
      expect(subject).to validate_presence_of(:description)
    end
  end
end
