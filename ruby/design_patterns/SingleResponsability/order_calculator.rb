# frozen_string_literal: true

# This class is responsible for calculating the order
class OrderCalculator
  def calculate(order)
    puts "Calculating total for order #{order.uuid} with amount #{order.amount}"
  end
end
