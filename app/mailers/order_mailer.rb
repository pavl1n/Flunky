# frozen_string_literal: false

# Sending reject or done mails
class OrderMailer < ApplicationMailer
  def notice_email(order)
    @order = order
    @client = User.find(order.client_id)
    mail(to: @client.email, subject: "Your order №#{@order.id} was #{@order.status}")
  end
end
