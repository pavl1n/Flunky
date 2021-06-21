require 'rails_helper'

RSpec.describe "Admins", type: :request do
  include Warden::Test::Helpers
  describe "PUT update product" do
    it "should update status of product" do
      admin = create(:admin)
      login_as(admin, scope: :admin)
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
      visit root_path(product)

      product.update(approved: true)
      expect(product.reload.approved).to eq true
    end
  end

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
