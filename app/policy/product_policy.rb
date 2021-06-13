# frozen_string_literal: false

# Separating each restaurant product edit
class ProductPolicy
  attr_reader :current_user, :resource

  def initialize(current_user:, resource:)
    @current_user = current_user
    @resource = resource
  end

  def able_to_edit?
    current_user.id == resource.user_id
  end
end
