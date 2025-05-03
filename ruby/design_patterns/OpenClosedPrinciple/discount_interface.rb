# frozen_string_literal: true

# This module defines an interface for applying discounts to orders.
# It raises an error if the method is not implemented in the class that includes this module.
#
# @example
#   class PercentageDiscount
#     include DiscountInterface
#
#     def apply(order_amount)
#       order_amount * 0.1
#     end
#   end
#
#   discount = PercentageDiscount.new
#   puts discount.apply(100) # => 10.0
#
module DiscountInterface
  class MethodNotImplementedError < StandardError; end

  def apply(_order_amount)
    raise MethodNotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
