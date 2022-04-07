# frozen_string_literal: true

# Stripe checkout
class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  after_action :reset_session, only: [:show]

  def show
    current_user.set_payment_processor :stripe
    products = Product.find(params[:id])

    @checkout_session = current_user.payment_processor.checkout(
      mode: 'payment',
      line_items: products.collect.with_index { |item, index| item.to_builder(params[:quantity][index]).attributes! },
      success_url: order_success_url,
      cancel_url: order_cancel_url
    )
  end

  def success
    stripe_user
  end

  def cancel
    stripe_user
  end

  private

  def stripe_user
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = Stripe::Customer.retrieve(session.customer)
  end

  def reset_session
    session[:order_id] = nil
  end
end
