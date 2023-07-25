# frozen_string_literal: true

# Given two strings needle and haystack, return the index of the first occurrence of needle in haystack,
# or -1 if needle is not part of haystack.

def str_str(haystack, needle)
  # 1. If needle is empty, return 0
  return 0 if needle.empty?

  # 2. If needle is not empty, iterate through haystack
  haystack.chars.each.with_index do |str, i|
    # 3. If the current character is the same as the first character of needle, check if the next characters
    if str == needle[0]
      # 4. If the next characters are the same as needle, return the index
      return i if haystack[i..(i + (needle.length - 1))] == needle
    end
  end

  -1
end

haystack = 'sadbutsad'
needle = 'sad'
p str_str(haystack, needle)
# Output: 0
# Explanation: 'sad' occurs at index 0 and 6.
# The first occurrence is at index 0, so we return 0.

haystack = 'leetcode'
needle = 'leeto'
p str_str(haystack, needle)
# Output: -1
# Explanation: 'leeto' did not occur in 'leetcode', so we return -1.
