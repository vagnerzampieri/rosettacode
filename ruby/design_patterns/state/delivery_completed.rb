# frozen_string_literal: true

require_relative 'state_interface'

# This class represents the "Delivery Completed" state of an order.
# In this state, the order has been delivered and cannot be modified.
# The order cannot be prepared or delivered again in this state.
#
# @see StateInterface
# @see Order
class DeliveryCompleted
  include StateInterface

  def prepare_order(_order)
    raise 'Order already delivered'
  end

  def start_delivery(_order)
    raise 'Order already delivered'
  end

  def finalize_delivery(_order)
    raise 'Order already delivered'
  end
end
