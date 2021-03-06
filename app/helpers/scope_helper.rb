# frozen_string_literal: false

# Define scope for different roles
module ScopeHelper
  def client(user)
    user_signed_in? && (user.admin? || user.restaurant?)
  end

  def admin(user)
    user_signed_in? && user.admin?
  end
end
