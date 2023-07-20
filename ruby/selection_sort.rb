# frozen_string_literal: true

def find_min_index(array)
  min_index = 0
  min_value = array[0]

  array.each.with_index do |value, i|
    if value < min_value
      min_index = i
      min_value = value
    end
  end

  min_index
end

def selection_sort(array)
  new_array = []

  array.length.times do
    min_index = find_min_index(array)
    new_array << array.delete_at(min_index)
  end

  new_array
end

p selection_sort([5, 3, 6, 2, 10])

p selection_sort([5, 3, 6, 2, 10, -1, 0, 4])

p selection_sort([5, 3, 6, 2, 10, -1, 0, 4, 1])
