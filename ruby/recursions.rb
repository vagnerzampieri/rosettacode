# frozen_string_literal: true

# table test
# array = [1, 2, 3, 4, 5]
# array = [2, 3, 4, 5]
# array = [3, 4, 5]
# array = [4, 5]
# array = [5]
# array = []
# 5 + 0 = 5
# 4 + 5 = 9
# 3 + 9 = 12
# 2 + 12 = 14
# 1 + 14 = 15
def recursion_sum(array)
  return 0 if array.empty?

  array[0] + recursion_sum(array[1..])
end

p recursion_sum([1, 2, 3, 4, 5])

p recursion_sum([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

def recursion_mut(array)
  return 1 if array.empty?

  array[0] * recursion_mut(array[1..])
end

p recursion_mut([1, 2, 3, 4, 5])

p recursion_mut([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
