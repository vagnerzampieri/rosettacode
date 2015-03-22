# Implements a simple accumulator, whose
# value is accessed via the attribute
# _counter_. Calling the method Counter#inc
# increments this value.
class Counter

  # the current value of the count
  attr_reader :counter

  # create a new Counter with the given
  # initial value
  def initialize(initial_value=0)
    @counter = initial_value
  end

  #increment the current value of the count
  def inc
    @counter += 1
  end
end
