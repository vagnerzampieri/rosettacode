a = [1, 3, 'cat']
enum_a = a.each
enum_a.next
enum_a.next

short_enum = [1, 2, 3].to_enum
long_enum = ('a'..'z').to_enum

loop do
  p short_enum.next
end

loop do
  p long_enum.next
end

enum = 'cat'.enum_for(:each_char)
p enum.to_a

enum_in_threes = (1..10).enum_for(:each_slice, 3)
p enum_in_threes.to_a

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count += 1
    yielder.yield number
  end
end

p triangular_numbers.first(5)

def infinite_select(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield(value) if block.call(value)
    end
  end
end

p infinite_select(triangular_numbers) { |val| val % 10 == 0 }.first(5)

class Enumerator
  def infinite_select(&block)
    Enumerator.new do |yielder|
      self.each do |value|
        yielder.yield(value) if block.call(value)
      end
    end
  end
end

p triangular_numbers
  .infinite_select { |val| val % 10 == 0 }
  .infinite_select { |val| val.to_s =~ /3/ }
  .first(5)

p 'Lazy Enumerators in Ruby 2'

def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield(n += 1) }
  end.lazy
end

p Integer.all.first(10)

p Integer
  .all
  .select { |i| (i % 3).zero? }
  .first(10)

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end

p Integer
  .all
  .select { |i| (i % 3).zero? }
  .select { |i| palindrome?(i) }
  .first(10)

multiple_of_three = Integer
  .all
  .select { |i| (i % 3).zero? }

p multiple_of_three.first(10)

m3_palindrome = multiple_of_three
  .select { |i| palindrome?(i) }

p m3_palindrome.first(10)

multiple_of_three = -> n { (n % 3).zero? }
palindrome = -> n { n = n.to_s; n == n.reverse }

p Integer
  .all
  .select(&multiple_of_three)
  .select(&palindrome)
  .first(10)
