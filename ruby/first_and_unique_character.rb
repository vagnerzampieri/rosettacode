# frozen_string_literal: true

# Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

def first_and_unique_character(str)
  array = str.chars
  count = Hash.new(0)

  array.each { |s| count[s] += 1 }

  count.each do |key, value|
    return array.index(key) if value == 1
  end

  -1
end

s = 'leetcode'
p first_and_unique_character(s)
# Output: 0

s = 'loveleetcode'
p first_and_unique_character(s)
# Output: 2

s = 'aabb'
p first_and_unique_character(s)
# Output: -1
