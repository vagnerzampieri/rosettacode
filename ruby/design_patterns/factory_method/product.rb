# frozen_string_literal: true

# The Product interface declares the operations that all concrete products must
# implement.
class Product
  # return [String]
  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
