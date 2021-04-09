# frozen_string_literal: false

# ApplicationController will be updated
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
