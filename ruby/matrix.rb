# frozen_string_literal: true

def find_fourth_repeated_number(matrix)
  # 1. create a hash
  count = Hash.new(0)

  # 2. loop trough the matrix
  matrix.each do |row|
    # 3. loop trough the row
    row.each do |number|
      # 4. add the number to the hash
      count[number] += 1
      # 5. return the number if the count is 4
      return number if count[number] == 4
    end
  end

  # 6. return nil if the number is not found
  nil
end

matrix = [
  [1, 2, 3, 1, 1, 3],
  [2, 2, 3, 1, 2, 2],
  [3, 3, 3, 1, 3, 1]
]

# matrix = [[1, 2, 3]]

result = find_fourth_repeated_number(matrix)
puts "the number is: #{result}" if result
puts 'none' if result.nil?
