# frozen_string_literal: true

def binary_search(list, item)
  low_index = 0
  high_index = list.length - 1

  while low_index <= high_index
    middle_index = (low_index + high_index) / 2
    guess = list[middle_index]

    return middle_index if guess == item

    guess > item ? high_index = middle_index - 1 : low_index = middle_index + 1
  end

  'None'
end

puts binary_search([1, 3, 5, 7, 9], 3)

puts binary_search([1, 3, 5, 7, 9], -1)

puts binary_search([1, 3, 5, 7, 9, 11, 13, 15, 17, 19], 13)
