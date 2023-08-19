# frozen_string_literal: true

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  stringified = x.to_s
  reversed = ''
  stringified.each_char { |str| reversed = str + reversed }

  stringified == reversed
end

x = 121
puts is_palindrome(x)
# Output: true
# Explanation: 121 reads as 121 from left to right and from right to left.
# Example 2:

x = -121
puts is_palindrome(x)
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

x = 10
puts is_palindrome(x)
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
