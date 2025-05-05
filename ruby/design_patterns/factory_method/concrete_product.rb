# frozen_string_literal: true

require_relative 'product'

# Concrete Products provide various implementations of the Product interface.
class ConcreteProduct < Product
  # @return [String]
  def operation
    '{Result of the ConcreteProduct}'
  end
end
