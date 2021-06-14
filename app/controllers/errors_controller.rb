# frozen_string_literal: false

# Handling errors on pages
class ErrorsController < ApplicationController
  protect_from_forgery with: :null_session

  def not_found
    render(status: 404)
  end

  def not_authorized
    render(status: 403)
  end

  def internal_server_error
    render(status: 500)
  end
end
