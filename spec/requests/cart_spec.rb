require 'rails_helper'

RSpec.describe "Cart", type: :request do
  describe "GET cart#show" do

    it "should render cart#show template" do
      restaurant = create(:restaurant)
      product = restaurant.products.new(
        name: Faker::Food.dish,
        price: Faker::Types.rb_integer,
        category: Faker::Restaurant.type,
        description: Faker::Food.description[0...100],
        approved: true
        )
      product.product_picture.attach(io: File.open("#{Rails.root}/spec/fixtures/3.jpeg"), filename: '3.jpeg')
      product.save
      order = Order.create
      order_position = order.order_positions.create(product_id: product.id, quantity: 1)
      visit cart_path()
      expect(page).not_to have_content(order.order_positions)
    end
  end
end
