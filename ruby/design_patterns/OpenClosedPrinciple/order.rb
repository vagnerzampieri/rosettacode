# frozen_string_literal: true

# This class is responsible for applying discounts to orders
class Order
  def initialize(uuid:, amount:, discount: nil)
    @uuid = uuid
    @amount = amount
    @discount = discount
  end

  def amount
    @amount = @discount.apply(@amount) if @discount

    @amount
  end

  def to_s
    "Order UUID: #{@uuid}, Amount: #{@amount}"
  end
end
