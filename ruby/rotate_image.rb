# frozen_string_literal: true

# You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

# You have to rotate the image in-place, which means you have to modify the input 2D matrix directly.
# DO NOT allocate another 2D matrix and do the rotation.

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
# Big O: O(n^2)
def rotate(matrix)
  new_matrix = []

  # 1. Get the length of the matrix
  matrix.length.times do
    new_array = []

    # 2. Pop the last element of each row and prepend it to a new array
    matrix.each do |row|
      new_array.prepend(row.pop)
    end

    # 3. Prepend the new array to the new matrix
    new_matrix.prepend(new_array)
  end

  matrix.replace(new_matrix)
end

matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p rotate(matrix)
# Output: [[7, 4, 1], [8, 5, 2], [9, 6, 3]]

matrix = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
p rotate(matrix)
# Output: [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]]
