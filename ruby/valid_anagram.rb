# frozen_string_literal: true

def valid_anagram(s, t)
  count_s = Hash.new(0)
  count_t = Hash.new(0)

  s.each_char { |str| count_s[str] += 1 }
  t.each_char { |str| count_t[str] += 1 }

  count_s == count_t
end

s = 'anagram'
t = 'nagaram'
p valid_anagram(s, t)
# Output: true

s = 'rat'
t = 'car'
p valid_anagram(s, t)
# Output: false
