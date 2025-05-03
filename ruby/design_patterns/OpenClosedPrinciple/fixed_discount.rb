# frozen_string_literal: true

require_relative 'discount_interface'

# This class implements a fixed discount strategy
# It applies a fixed amount discount to the order
# It raises an error if the discount is greater than the order amount
#
# Example:
#   discount = FixedDiscount.new(10)
#   order_amount = 100
#   new_amount = discount.apply(order_amount)
#   puts new_amount # Output: 90
#
class FixedDiscount
  include DiscountInterface

  def initialize(discount)
    @discount = discount
  end

  # Applies a fixed discount to the order amount.
  # Raises an error if the discount is greater than the order amount.
  #
  # @param order_amount [Float] The original order amount.
  # @return [Float] The new order amount after applying the discount.
  # @raise [ArgumentError] if the discount is greater than the order amount.
  def apply(order_amount)
    raise ArgumentError, "Discount cannot be greater than order amount" if @discount > order_amount

    order_amount - @discount
  end
end
