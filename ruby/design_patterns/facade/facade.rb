# frozen_string_literal: true

# The Facade class provides a simple interface to the complex logic of one or
# several subsystems. The Facade delegates the client requests to the
# appropriate objects within the subsystem. The Facade is also responsible for
# managing their lifecycle. All of this shields the client from the undesired
# complexity of the subsystem.
class Facade
  # Depending on your application's needs, you can provide the Facade with
  # existing subsystem objects or force the Facade to create them on its own.
  def initialize(subsystem_one, subsystem_two)
    @subsystem_one = subsystem_one || SubsystemOne.new
    @subsystem_two = subsystem_two || SubsystemTwo.new
  end

  # The Facade's methods are convenient shortcuts to the sophisticated
  # functionality of the subsystems. However, clients get only to a fraction of
  # a subsystem's capabilities.
  def operation
    results = []
    results.append('Facade initializes subsystems:')
    results.append(@subsystem_one.operation_one)
    results.append(@subsystem_two.operation_one)
    results.append('Facade orders subsystems to perform the action:')
    results.append(@subsystem_one.operation_n)
    results.append(@subsystem_two.operation_z)
    results.join("\n")
  end
end
