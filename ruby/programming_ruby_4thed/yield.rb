def call_block
  puts "Start method"
  yield
  puts "End of method"
end

call_block { puts "In the block" }


def who_says_what
  yield("Dave", "hello")
  yield("Andy", "goodbye")
end

who_says_what do |person, phrase|
  puts "#{person} says #{phrase}"
end
