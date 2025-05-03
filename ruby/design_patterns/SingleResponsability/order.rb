# frozen_string_literal: true

class Order
  attr_reader :uuid, :amount

  def initialize(uuid:, amount:)
    @uuid = uuid
    @amount = amount
  end

  def to_s
    "Order UUID: #{@uuid}, Amount: #{@amount}"
  end
end
