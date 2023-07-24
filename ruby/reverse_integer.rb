# frozen_string_literal: true

# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value
# to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

# @param {Integer} x
# @return {Integer}
# Big O: O(n)
def reverse(x)
  max_32bit = 2**31 - 1
  min_32bit = -2**31

  is_negative = x.negative?
  x = x.abs

  reversed = 0

  # 1. Iterate through each digit of the number
  while x.positive?
    # 2. Get the last digit of the number
    last_digit = x % 10
    p "last_digit: #{last_digit}"

    # 3. Remove the last digit of the number
    x /= 10
    p "x: #{x}"

    # 4. Add the last digit to the reversed number
    reversed = reversed * 10 + last_digit
    p "reversed: #{reversed}"
  end

  # 5. Make the reversed number negative if the original number was negative
  reversed *= -1 if is_negative

  # 6. Return 0 if the reversed number is outside the signed 32-bit integer range
  return 0 if reversed > max_32bit || reversed < min_32bit

  reversed
end

x = 123
p reverse(x)
# Output: 321

# x = -123
# p reverse(x)
# Output: -321

# x = 120
# p reverse(x)
# Output: 21

# x = 1_534_236_469
# p reverse(x)
# Output: 0

# x = -2_147_483_648
# p reverse(x)
# Output: 0
