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
