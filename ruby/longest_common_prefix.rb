# frozen_string_literal: true

# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

def longest_common_prefix(strs)
  # 1. If strs is empty, return ''
  return '' if strs.empty?

  # 2. If strs is not empty, iterate through the first string
  strs[0].chars.each.with_index do |char, i|
    # 3. Iterate through the rest of the strings
    strs[1..].each do |str|
      # 4. If the current character is not the same as the character at the same index
      # in the other strings, return the substring
      return strs[0][0...i] if char != str[i]
    end
  end

  strs[0]
end

strs = %w[flower flow flight]
p longest_common_prefix(strs)
# Output: 'fl'

strs = %w[dog racecar car]
p longest_common_prefix(strs)
# Output: ''
# Explanation: There is no common prefix among the input strings.
