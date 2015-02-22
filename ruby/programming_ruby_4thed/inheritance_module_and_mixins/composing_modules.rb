class VowelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end

  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel
    end
  end
end

vf = VowelFinder.new('the quick brown fox jumped')
p vf.inject(:+)

module Summable
  def sum
    inject(:+)
  end
end

class Array
  include Summable
end

class Range
  include Summable
end

class VowelFinder
  include Summable
end

p [1, 2, 3, 4, 5].sum
p ('a'..'m').sum

vf = VowelFinder.new('the quick brown fox jumped')
p vf.sum
