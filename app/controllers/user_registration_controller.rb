# frozen_string_literal: false

# Controller for client profile page
class UserRegistrationController < ApplicationController
  before_action :authenticate_user!

  def profile; end
end
