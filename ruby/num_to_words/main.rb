# frozen_string_literal: true

# transform a number into a number with words
# get the number from the user
# use a hash table to get the information about the words
# split numbers to combine values and generate the correct phrase
#
# fases:
# 1 => one, 12 => twelve, 20 => twenty, 21 => twenty-one
# 100 => one hundred, 101 => one hundred one, 1001 => one thousand one,
# 1234 => one thousand two hundred thirty-four

WORDS = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
  6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven',
  12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',
  17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen', 20 => 'twenty', 30 => 'thirty',
  40 => 'forty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety'
}.freeze

def number_to_words(num)
  return WORDS[num] if WORDS[num]
  return more_than_ninety_nine(num) if num >= 100 && num <= 999

  less_than_one_hundred(num)
end

def less_than_one_hundred(num)
  tens_digit = num / 10 * 10
  ones_digit = num % 10

  return "#{WORDS[tens_digit]} #{WORDS[ones_digit]}" if ones_digit.positive?

  WORDS[tens_digit]
end

def more_than_ninety_nine(num)
  first_digit = num / 100
  other_digits = num % 100

  word = less_than_one_hundred(other_digits).gsub('zero', '')

  "#{WORDS[first_digit]} hundred #{word}"
end

# (1..100).each do |num|
#   puts "#{num}: #{number_to_words(num)}"
# end

[1, 2, 20, 21, 100, 101, 234, 999].each do |num|
  puts "#{num}: #{number_to_words(num)}"
end
