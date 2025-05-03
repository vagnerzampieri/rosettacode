# frozen_string_literal: true

# This module defines the interface for the state classes in the State pattern.
# Each state class must implement the methods defined in this module.
#
# @see Placed
# @see Preparing
# @see DeliveryStarted
# @see DeliveryCompleted
module StateInterface
  class MethodNotImplementedError < StandardError; end

  def prepare_order(_order)
    raise MethodNotImplementedError, "This #{self.class} cannot respond to:"
  end

  def start_delivery(_order)
    raise MethodNotImplementedError, "This #{self.class} cannot respond to:"
  end

  def finalize_delivery(_order)
    raise MethodNotImplementedError, "This #{self.class} cannot respond to:"
  end
end
