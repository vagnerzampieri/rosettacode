module Debug
  def who_am_i?
    "#{self.class.name} (id> #{self.object_id}): #{self.name}"
  end
end

class Phonograph
  include Debug
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class EightTrack
  include Debug
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

ph = Phonograph.new('West End Blues')
et = EightTrack.new('Surrealistic Pillow')

p ph.who_am_i?
p et.who_am_i?

class Person
  include Comparable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "#{@name}"
  end

  def <=>(other)
    self.name <=> other.name
  end
end

p1 = Person.new('Matz')
p2 = Person.new('Guido')
p3 = Person.new('Larry')

if p1 > p2
  puts "#{p1.name}'s name > #{p2.name}'s name"
end

puts 'Sorted List:'
puts [p1, p2, p3].sort
