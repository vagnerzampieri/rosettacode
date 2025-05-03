# frozen_string_literal: true

# This file is responsible for testing the Open Closed Principle
# It demonstrates how to use the Open Closed Principle in Ruby
# and how to extend the functionality of a class without modifying it.
# It also shows how to use the Strategy Pattern to implement different discount strategies.

require_relative 'order'
require_relative 'fixed_discount'
require_relative 'percentage_discount'

order = Order.new(uuid: '1234', amount: 100, discount: FixedDiscount.new(10))
puts order.amount

order = Order.new(uuid: '1234', amount: 200, discount: PercentageDiscount.new(10))
puts order.amount

order = Order.new(uuid: '1234', amount: 200)
puts order.amount
