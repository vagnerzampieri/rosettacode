# frozen_string_literal: true

require_relative 'state_interface'
require_relative 'preparing'

# This class represents the "Placed" state of an order.
# In this state, the order has been placed but not yet prepared.
# The order can only be prepared in this state.
#
# @see StateInterface
# @see Preparing
# @see Order
class Placed
  include StateInterface

  def prepare_order(order)
    order.state(Preparing.new)
    puts 'Order is being prepared'
  end

  def start_delivery(_order)
    raise 'Order not ready for delivery'
  end

  def finalize_delivery(_order)
    raise 'Order not ready for delivery'
  end
end
