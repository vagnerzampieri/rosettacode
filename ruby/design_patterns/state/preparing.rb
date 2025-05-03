# frozen_string_literal: true

require_relative 'state_interface'
require_relative 'delivery_started'

# This class represents the "Preparing" state of an order.
# In this state, the order is being prepared but not yet delivered.
# The order can only be delivered in this state.
#
# @see StateInterface
# @see DeliveryStarted
# @see Order
class Preparing
  include StateInterface

  def prepare_order(_order)
    raise 'Order already being prepared'
  end

  def start_delivery(order)
    order.state(DeliveryStarted.new)
    puts 'Delivery started'
  end

  def finalize_delivery(_order)
    raise 'Order already being prepared'
  end
end
