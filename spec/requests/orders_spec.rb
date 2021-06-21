require 'rails_helper'
RSpec.describe "Orders", type: :request do
  include Warden::Test::Helpers
  describe "GET /index" do
    it "should list order" do
      client = create(:client)
      order = Order.create(client_id: client.id)
      login_as(client, scope: :client)
      visit user_orders_path(user_id: client.id)

      page.should have_content(order.id)
    end
  end
end
