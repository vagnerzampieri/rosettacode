# frozen_string_literal: true

require_relative 'placed'

## This class represents an order in a state machine pattern.
## It manages the state of the order and allows transitions between different states.
## The order can be in one of the following states:
## - Placed: The order has been placed but not yet prepared.
## - Preparing: The order is being prepared but not yet delivered.
## - Delivery Started: The order is in delivery but not yet completed.
## - Delivery Completed: The order has been delivered and cannot be modified.
## The order can be prepared, started for delivery, or finalized for delivery.
## @see Placed
## @see Preparing
## @see DeliveryStarted
## @see DeliveryCompleted
class Order
  def initialize
    @state = Placed.new
  end

  def state(new_state)
    @state = new_state
  end

  def prepare_order
    @state.prepare_order(self)
  end

  def start_delivery
    @state.start_delivery(self)
  end

  def finalize_delivery
    @state.finalize_delivery(self)
  end
end
