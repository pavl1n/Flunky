require 'rails_helper'

RSpec.describe "Admins", type: :request do
  include Warden::Test::Helpers
  describe "PUT update restaurant" do
    it "should update status of restaurant" do
      admin = create(:admin)
      login_as(admin, scope: :admin)
      restaurant = create(:restaurant)
      visit root_path(restaurant)

      restaurant.update(confirmed: true)
      expect(restaurant.reload.confirmed).to eq true
    end
  end
end
