# frozen_string_literal: true

# Big O: O(n)
def valid_palindrome(s)
  modified_s = s.downcase.delete('^a-z0-9')

  modified_s == modified_s.reverse
end

s = 'A man, a plan, a canal: Panama'
p valid_palindrome(s)
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

s = 'race a car'
p valid_palindrome(s)
# Output: false
# Explanation: "raceacar" is not a palindrome.

s = ' '
p valid_palindrome(s)
# Output: true
# Explanation: s is an empty string "" after removing non-alphanumeric characters.
# Since an empty string reads the same forward and backward, it is a palindrome.
