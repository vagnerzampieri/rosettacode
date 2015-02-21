class WalkException < ArgumentError; end

def walk(d)
  raise WalkEx if d == :north
  puts :south
rescue WalkException => e
  puts "#{e}: thats argument is invalid"
end

walk(:south)
#walk(:north)

for i in 1..5
  begin
    do_something
  rescue => exception
    p "#{exception}: logar #{i}"
  end
end
