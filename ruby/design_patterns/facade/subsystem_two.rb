# frozen_string_literal: true

# Some facades can work with multiple subsystems at the same time.
class SubsystemTwo
  # @return [String]
  def operation_one
    'SubsystemTwo: Get ready!'
  end

  # ...

  # @return [String]
  def operation_z
    'SubsystemTwo: Fire!'
  end
end
