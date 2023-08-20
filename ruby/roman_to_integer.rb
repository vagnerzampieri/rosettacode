# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer.

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  # 1. Create a hash table to store the values of Roman numerals
  roman_values = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  # 2. Initialize the result
  result = 0

  # 3. Iterate through the Roman numeral string
  i = 0

  # 4. While is used instead of each_char because we need to access the next character
  while i < s.length
    # 5. Get the value of the current Roman numeral
    current_value = roman_values[s[i]]
    # 6. Get the value of the next Roman numeral
    next_value = roman_values[s[i + 1]]

    # 7. Check if the current numeral is smaller than the next numeral
    if i + 1 < s.length && next_value > current_value
      # 8. If yes, subtract its value from the result
      result += next_value - current_value
      i += 2 # 9. Skip the next numeral
    else
      # 10. If no, add its value to the result
      result += current_value
      i += 1
    end
  end

  result
end

s = 'III'
# puts roman_to_int(s)
# Output: 3
# Explanation: III = 3.

s = 'LVIII'
# puts roman_to_int(s)
# Output: 58
# Explanation: L = 50, V= 5, III = 3.

s = 'MCMXCIV'
puts roman_to_int(s)
# Output: 1994
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
