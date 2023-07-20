# frozen_string_literal: true

# add var to get max_index
# add var to get max_value
# loop trough the array
# if the value is max, update vars
# return the max_index

def find_max_index(array)
  max_value = array[0]
  max_index = 0

  array.each.with_index do |value, i|
    if value > max_value
      max_value = value
      max_index = i
    end
  end

  max_index
end

puts find_max_index([7, 2, 3, 9, 4])

puts find_max_index([7, 2, 3, -9, 4])

puts find_max_index([7, 2, 3, 0, 4])
