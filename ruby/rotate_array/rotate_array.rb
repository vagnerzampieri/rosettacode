# frozen_string_literal: true

# Rotate Array
# https://www.programcreek.com/2015/03/rotate-array-in-java/
# Rotate an array of n elements to the right by k steps.

# For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated
# to [5,6,7,1,2,3,4]. How many different ways do you know to solve this problem?

def rotate_array(k = 0, n = 10)
  new_array = Array.new(n)

  n.times do |i|
    next_value = i + 1
    next_index = k + i
    last_index = n - 1

    next new_array[(n - k - i) * -1] = next_value if last_index < next_index
    next new_array[next_index] = next_value if last_index == next_index

    new_array[next_index] = next_value
  end

  new_array
end