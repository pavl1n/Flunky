# frozen_string_literal: true

# Service state machine for order flow
class OrderService
  include AASM

  def initialize(order)
    @current_order = order
    aasm.current_state = order.status.to_sym
  rescue StandardError => e
    Rails.logger.info "Rescued: #{e.inspect}"
  end

  aasm do
    state :create_rest_order, before_enter: :create_restaurant_order
    state :waiting
    state :approve_by_restaurant, before_enter: :approve_and_update
    state :finish_order, after: :finish

    event :create_restaurant_order do
      transitions from: :create_rest_order, to: :waiting
    end

    event :approve_restaurant do
      transitions from: :waiting, to: :approve_by_restaurant
    end

    event :finish do
      transitions from: :approve_by_restaurant, to: :finish_order
    end
  end

  def create_restaurant_order
    return if @current_order.instance_of?(RestaurantOrder)

    @current_order.products.each do |product|
      @current_order.restaurant_orders.find_or_create_by(user_id: product.user_id)
    end
  end

  def approve_and_update
    @current_order.update(approved: true, status: 1)
  end

  def finish
    @current_order.update(status: 2)
  end
end
