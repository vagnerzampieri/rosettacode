# frozen_string_literal: true

# Big O: O(n)
def reverse_string(str)
  new_str = ''

  str.each_char { |s| new_str = s + new_str }

  new_str
end

p reverse_string('pavê')
p reverse_string('alinhamento')
