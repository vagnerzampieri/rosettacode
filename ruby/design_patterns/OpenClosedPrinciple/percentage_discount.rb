# frozen_string_literal: true

require_relative 'discount_interface'

# This class implements a percentage discount strategy.
# It applies a percentage discount to the order amount.
# It raises an error if the discount is greater than the order amount.
#
# # Example:
#  discount = PercentageDiscount.new(10)
#  order_amount = 100
#  new_amount = discount.apply(order_amount)
#  puts new_amount # Output: 90
#
class PercentageDiscount
  include DiscountInterface

  def initialize(discount)
    @discount = discount
  end

  # Applies a percentage discount to the order amount.
  # Raises an error if the discount is greater than the order amount.
  #
  # @param order_amount [Float] The original order amount.
  # @return [Float] The new order amount after applying the discount.
  # @raise [ArgumentError] if the discount is not between 0 and 100.
  def apply(order_amount)
    raise ArgumentError, "Discount percentage must be between 0 and 100" if @discount > 100 || @discount.negative?

    order_amount - (order_amount * @discount / 100)
  end
end
