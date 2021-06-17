# frozen_string_literal: false

# This module smells of :reek:IrresponsibleModule
class ApplicationMailer < ActionMailer::Base
  default from: 'flunkysender@gmail.com'
  layout 'mailer'
end
