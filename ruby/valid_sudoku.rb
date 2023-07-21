# frozen_string_literal: true

# Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
# - Each row must contain the digits 1-9 without repetition.
# - Each column must contain the digits 1-9 without repetition.
# - Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
# Note:
# - A Sudoku board (partially filled) could be valid but is not necessarily solvable.
# - Only the filled cells need to be validated according to the mentioned rules.

# @param {Character[][]} board
# @return {Boolean}
# Big O: O(n^2)
def valid_sudoku?(board)
  hash_column = Hash.new { |hash, key| hash[key] = Hash.new(0) }

  divide_into_subgrids(board).each do |row|
    hash_row = Hash.new(0)

    row.each do |rw|
      hash_row[rw] += 1
      return false if hash_row[rw] > 1
    end
  end

  board.each do |row|
    hash_row = Hash.new(0)

    row.each.with_index do |rw, i|
      next if rw == '.'

      hash_row[rw] += 1
      hash_column[i][rw] += 1

      return false if hash_row[rw] > 1
      return false if hash_column[i][rw] > 1
    end
  end

  true
end

def divide_into_subgrids(board)
  subgrids = []

  (0..6).step(3) do |row_start|
    (0..6).step(3) do |col_start|
      subgrid = []

      3.times do |row_offset|
        3.times do |col_offset|
          value = board[row_start + row_offset][col_start + col_offset]
          subgrid << value unless value == '.'
        end
      end

      subgrids << subgrid
    end
  end

  subgrids
end

board = [
  ['5', '3', '.', '.', '7', '.', '.', '.', '.'],
  ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
  ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
  ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
  ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
  ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
  ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
  ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
  ['.', '.', '.', '.', '8', '.', '.', '7', '9']
]
p valid_sudoku?(board)
# p divide_into_subgrids(board)
# true

board = [
  ['8', '3', '.', '.', '7', '.', '.', '.', '.'],
  ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
  ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
  ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
  ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
  ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
  ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
  ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
  ['.', '.', '.', '.', '8', '.', '.', '7', '9']
]
p valid_sudoku?(board)
# false

board = [
  ['8', '8', '.', '.', '7', '.', '.', '.', '.'],
  ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
  ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
  ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
  ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
  ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
  ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
  ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
  ['.', '.', '.', '.', '8', '.', '.', '7', '9']
]
p valid_sudoku?(board)
# false
