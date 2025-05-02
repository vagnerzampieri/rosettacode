# frozen_string_literal: true

# This module defines a TaxTypeInterface that requires any class that includes it
# to implement the calculate_tax method. This is a common pattern in Ruby to
# enforce a contract for classes that implement specific functionality.

# Interface for tax types
module TaxTypeInterface
  class MethodNotImplementedError < StandardError; end

  # This method should be implemented by any class that includes this module.
  def calculate_tax
    raise MethodNotImplementedError, "This #{self.class} cannot respond to:"
  end
end
