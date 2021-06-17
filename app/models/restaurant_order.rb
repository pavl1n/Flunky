# frozen_string_literal: false

# Model which binding orders and restaurants
class RestaurantOrder < ApplicationRecord
  scope :approved, -> { where(approved: true) }
  belongs_to :order
  belongs_to :restaurant, -> { where user_type: :restaurant }, class_name: 'User', foreign_key: 'user_id'
  enum status: { waiting: 0, in_progress: 1, done: 2 }

  def find_products_name(id)
    ActiveRecord::Base.connection.execute(find_products_name_sql(id)).to_a.map { |res| res.first.last }
  end

  def find_products_quantity(id)
    ActiveRecord::Base.connection.execute(find_products_quantity_sql(id)).to_a.map { |res| res.first.last }
  end

  private

  def find_products_name_sql(current_user_id)
    <<-SQL
    SELECT
	    products.name
    FROM
	    orders
	  JOIN order_positions ON order_positions.order_id = orders.id
	  JOIN products ON products.id = order_positions.product_id
    WHERE
	    products.user_id = #{current_user_id}
	    AND orders.id = #{order_id}
    SQL
  end

  def find_products_quantity_sql(current_user_id)
    <<-SQL
    SELECT
	    order_positions.quantity
    FROM
	    orders
	  JOIN order_positions ON order_positions.order_id = orders.id
	  JOIN products ON products.id = order_positions.product_id
    WHERE
	    products.user_id = #{current_user_id}
	    AND orders.id = #{order_id}
    SQL
  end
end
