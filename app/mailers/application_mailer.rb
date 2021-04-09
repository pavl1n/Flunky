# frozen_string_literal: false

# This module smells of :reek:IrresponsibleModule
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
