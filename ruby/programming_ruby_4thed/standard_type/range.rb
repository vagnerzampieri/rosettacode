class PowerOfTwo
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def <=>(other)
    @value <=> other.value
  end

  def succ
    PowerOfTwo.new(@value + @value)
  end

  def to_s
    @value.to_s
  end
end

p1 = PowerOfTwo.new(4)
p2 = PowerOfTwo.new(32)

puts (p1..p2).to_a

puts "Ranges as Intervals"
car_age =  gets.to_f
case car_age
when 0..1
  puts 'Mmm.. new car smell'
when 1..3
  puts 'Nice and new'
when 3..10
  puts 'Reliable but slightly dinged'
when 10..30
  puts 'Clunker'
else
  puts 'Vintage gem'
end
