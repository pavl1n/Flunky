# frozen_string_literal: false

# Background job for updating status of order every minute
class StateUpdaterJob < ApplicationJob
  queue_as :default

  def perform
    Order.where(approved: true, status: %w[waiting in_progress]).each do |order|
      if order.restaurant_orders.where(approved: true).count == order.restaurant_orders.count
        order.update(status: 'in_progress')
      end
      if order.restaurant_orders.where(status: 'done').count == order.restaurant_orders.count
        order.update(status: 'done')
      end
    end
    puts 'Updated status'
  end
end
