# frozen_string_literal: true

# The Subsystem can accept requests either from the facade or client directly.
# In any case, to the Subsystem, the Facade is yet another client, and it's not
# a part of the Subsystem.
class SubsystemOne
  # @return [String]
  def operation_one
    'SubsystemOne: Ready!'
  end

  # ...

  # @return [String]
  def operation_n
    'SubsystemOne: Go!'
  end
end
