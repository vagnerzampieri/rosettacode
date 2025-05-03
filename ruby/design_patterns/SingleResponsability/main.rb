# frozen_string_literal: true

# This is an example of the SOLID design pattern
# in Ruby. It demonstrates the Single Responsibility Principle (SRP),
# Open/Closed Principle (OCP), Liskov Substitution Principle (LSP),
# Interface Segregation Principle (ISP), and Dependency Inversion Principle (DIP).
# The code is organized into classes that each have a single responsibility,
# and the classes are designed to be open for extension but closed for modification.
# The code is also designed to be easily testable and flexible, with dependencies
# injected through the constructor.

# This is a simple implementation of the Facade pattern, which provides a simplified
# interface to a complex subsystem. The OrderProcessorFacade class uses the
# InventoryChecker, OrderCalculator, and PaymentProcessor classes to perform
# the necessary operations for processing an order.

# The code is organized into separate files for each class, and the main file
# demonstrates how to use the classes together.

require_relative "order"
require_relative "order_processor_facade"
require_relative "inventory_checker"
require_relative "order_calculator"
require_relative "payment_processor"

order = Order.new(uuid: "12345", amount: 100.0)

inventory_checker = InventoryChecker.new
order_calculator = OrderCalculator.new
payment_processor = PaymentProcessor.new

order_processor = OrderProcessorFacade.new(
  inventory_checker: inventory_checker,
  order_calculator: order_calculator,
  payment_processor: payment_processor
)

order_processor.proccess_order(order)

p order.to_s
p order.uuid
p order.amount
