# frozen_string_literal: true

require_relative 'state_interface'
require_relative 'delivery_completed'

# This class represents the "Delivery Started" state of an order.
# In this state, the order is in delivery but not yet completed.
# The order can only be finalized in this state.
#
# @see StateInterface
# @see DeliveryCompleted
# @see Order
class DeliveryStarted
  include StateInterface

  def prepare_order(_order)
    raise 'Order already in delivery'
  end

  def start_delivery(_order)
    raise 'Order already in delivery'
  end

  def finalize_delivery(order)
    order.state(DeliveryCompleted.new)
    puts 'Delivery completed'
  end
end
