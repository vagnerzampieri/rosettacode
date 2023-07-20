# frozen_string_literal: true

# table test
# array = [1, 2, 3]
# array = [2, 3]
# array = [3]
# array = []
# 3 + 0 = 3
# 2 + 3 = 5
# 1 + 5 = 6
# 6 + 0 = 6
def recursion_sum(array)
  return 0 if array.empty?

  array[0] + recursion_sum(array[1..])
end

p recursion_sum([1, 2, 3])

p recursion_sum([1, 2, 3, 4, 5])

p recursion_sum([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

def recursion_mut(array)
  return 1 if array.empty?

  array[0] * recursion_mut(array[1..])
end

p recursion_mut([1, 2, 3, 4, 5])

p recursion_mut([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
