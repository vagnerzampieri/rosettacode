# frozen_string_literal: true

# This class that simplifies the order processing
class PaymentProcessor
  def process_payment(order)
    puts "Processing payment for order #{order.uuid} with amount #{order.amount}"
  end
end
