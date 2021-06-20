# frozen_string_literal: false

# Background job for updating status of order every minute
class StateUpdaterJob < ApplicationJob
  queue_as :default

  def perform
    Order.approved.where(status: %w[waiting in_progress]).each do |order|
      order.update(status: 'in_progress') if order.restaurant_orders.approved.count == order.restaurant_orders.count
      if order.restaurant_orders.where(status: 'done').count == order.restaurant_orders.count
        order.update(status: 'done')
        OrderMailer.notice_email(order).deliver_later
      end
    end
  end
end
