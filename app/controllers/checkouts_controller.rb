# frozen_string_literal: true

# Stripe checkout
class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.set_payment_processor :stripe
    products = Product.find(params[:id])

    @checkout_session = current_user.payment_processor.checkout(
      mode: 'payment',
      line_items: products.collect.with_index { |item, index| item.to_builder(params[:quantity][index]).attributes! }
    )
  end
end
