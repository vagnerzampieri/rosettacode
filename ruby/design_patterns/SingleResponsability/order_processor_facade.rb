# frozen_string_literal: true

# This class is responsible for facilitating the order processing
# It uses the InventoryChecker, OrderCalculator, and PaymentProcessor classes
# to perform the necessary operations for processing an order
#
# This class is an example of the Facade pattern. It provides a simplified interface
# to a complex subsystem, making it easier to use.
#
# The dependencies are passed in through the constructor, which allows for better
# testability and flexibility.
#
class OrderProcessorFacade
  def initialize(inventory_checker:, order_calculator:, payment_processor:)
    @inventory_checker = inventory_checker
    @order_calculator = order_calculator
    @payment_processor = payment_processor
  end

  def proccess_order(order)
    @inventory_checker.check(order)
    @order_calculator.calculate(order)
    @payment_processor.process_payment(order)
  end
end
