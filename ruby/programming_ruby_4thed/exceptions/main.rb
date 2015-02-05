class WalkException < ArgumentError; end

def walk(d)
  raise WalkEx if d == :north
  puts :south
rescue WalkException => e
  puts "#{e}: thats argument is invalid"
end

walk(:south)
walk(:north)
