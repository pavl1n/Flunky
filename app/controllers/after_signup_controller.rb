# frozen_string_literal: false

# Here describes steps after clients registration
class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :confirm_profile

  def show
    render_wizard
  end
end
