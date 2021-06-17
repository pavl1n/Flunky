# frozen_string_literal: false

# Sending link to registration path
class RestaurantRequestMailer < ApplicationMailer
  def welcome_email(email)
    mail(to: email, subject: 'Welcome to Flunky')
  end
end
