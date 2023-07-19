# frozen_string_literal: true

# Use:
# 1.upto(100) do |v|
#   p fizz_buzz(v)
# end
def fizz_buzz(value)
  word = ''
  word << 'fizz' if (value % 3).zero?
  word << 'buzz' if (value % 5).zero?
  word << value.to_s if word.empty?
  word
end
