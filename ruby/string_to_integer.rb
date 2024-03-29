# frozen_string_literal: true

# Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

# The algorithm for myAtoi(string s) is as follows:
#   - Read in and ignore any leading whitespace.
#   - Check if the next character (if not already at the end of the string) is '-' or '+'.
#   Read this character in if it is either. This determines if the final result is negative or positive respectively.
#   Assume the result is positive if neither is present.
#   - Read in next the characters until the next non-digit character or the end of the input is reached.
#   The rest of the string is ignored.
#   - Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read,
#   then the integer is 0. Change the sign as necessary (from step 2).
#   - If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer
#   so that it remains in the range. Specifically, integers less than -231 should be clamped to -231,
#   and integers greater than 231 - 1 should be clamped to 231 - 1.
#   - Return the integer as the final result.

# Note:
#   - Only the space character ' ' is considered a whitespace character.
#   - Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.

def my_atoi(s)
  # 1. Read in and ignore any leading whitespace.
  s = s.lstrip

  # 2. Check if the next character is '-' or '+'.
  sign = 1

  if s[0] == '-' || s[0] == '+'
    sign = -1 if s[0] == '-'
    s = s[1..]
  end

  # 3. Read in next the characters until the next non-digit character or the end of the input is reached.
  digits = s[/\A\d+/]

  # 4. Convert the digits into an integer.
  num = digits.to_i * sign

  # 5. Clamp the integer to the 32-bit signed integer range.
  int_min = -2**31
  int_max = 2**31 - 1

  num = int_min if num < int_min
  num = int_max if num > int_max

  # 6. Return the integer as the final result.
  num
end

s = '42'
p my_atoi(s)
# Output: 42
# Explanation: The underlined characters are what is read in, the caret is the current reader position.
# Step 1: "42" (no characters read because there is no leading whitespace)
#          ^
# Step 2: "42" (no characters read because there is neither a '-' nor '+')
#          ^
# Step 3: "42" ("42" is read in)
#            ^
# The parsed integer is 42.
# Since 42 is in the range [-231, 231 - 1], the final result is 42.

s = '   -42'
p my_atoi(s)
# Output: -42
# Explanation:
# Step 1: "   -42" (leading whitespace is read and ignored)
#             ^
# Step 2: "   -42" ('-' is read, so the result should be negative)
#              ^
# Step 3: "   -42" ("42" is read in)
#                ^
# The parsed integer is -42.
# Since -42 is in the range [-231, 231 - 1], the final result is -42.

s = '4193 with words'
p my_atoi(s)
# Output: 4193
# Explanation:
# Step 1: "4193 with words" (no characters read because there is no leading whitespace)
#          ^
# Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
#          ^
# Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
#              ^
# The parsed integer is 4193.
# Since 4193 is in the range [-231, 231 - 1], the final result is 4193.

s = '-0032'
p my_atoi(s)

s = 'words and 987'
p my_atoi(s)

s = '+1'
p my_atoi(s)
