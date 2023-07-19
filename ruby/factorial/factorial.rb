# frozen_string_literal: true

# Use:
# factorial(10)
# => 3628800
def factorial(value)
  return 1 if value.zero?

  (1..value).reduce(:*)
end

# def fat(value)
#   return 1 if value.zero?

#   value * fat(value - 1)
# end

# puts fat(5)
