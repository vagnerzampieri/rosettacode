# frozen_string_literal: true

# add var min_index
# add var min_value
# loop trough the array
# if the value is min, add the value and index to the variable
# return the min_index
def find_min_index(array)
  min_index = 0
  min_value = array[0]

  array.each_with_index do |value, i|
    if value < min_value
      min_index = i
      min_value = value
    end
  end

  min_index
end

puts find_min_index([7, 2, 3, 9, 4])

puts find_min_index([7, 2, 3, -9, 4])

puts find_min_index([7, 2, 3, 0, 4])
