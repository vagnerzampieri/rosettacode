# frozen_string_literal: true

# references:
# https://refactoring.guru/design-patterns/facade
# https://www.youtube.com/watch?v=4Aq9UHQ5f5Y

require_relative 'facade'
require_relative 'subsystem_one'
require_relative 'subsystem_two'

# The client code works with complex subsystems through a simple interface
# provided by the Facade. When a facade manages the lifecycle of the subsystem,
# the client might not even know about the existence of the subsystem. This
# approach lets you keep the complexity under control.
def client_code(facade)
  print facade.operation
end

# The client code may have some of the subsystem's objects already created. In
# this case, it might be worthwhile to initialize the Facade with these objects
# instead of letting the Facade create new instances.
subsystem_one = SubsystemOne.new
subsystem_two = SubsystemTwo.new
facade = Facade.new(subsystem_one, subsystem_two)
client_code(facade)
