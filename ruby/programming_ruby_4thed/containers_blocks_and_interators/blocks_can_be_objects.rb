class ProcExample
  def pass_in_block(&action)
    @stored_proc = action
  end

  def use_proc(parameter)
    @stored_proc.call(parameter)
  end
end

eg = ProcExample.new
eg.pass_in_block { |param, ot| puts "The parameter is #{param}" }
eg.use_proc(99)

def create_block_object(&block)
  block
end

bo = create_block_object { |param| puts "You called me with #{param}" }

bo.call 99
bo.call 'cat'

bo = lambda { |param| puts "You called me with #{param}" }

bo.call 99
bo.call 'cat'

bo = Proc.new { |param| puts "You called me with #{param}" }

bo.call 99
bo.call 'cat'

proc1 = -> arg { puts "In proc1 with #{arg}" }
proc2 = -> arg1, arg2 { puts "In proc2 with #{arg1} and #{arg2}" }
proc3 = -> (arg1, arg2) { puts "In proc3 with #{arg1} and #{arg2}" }

proc1.call 'ant'
proc2.call 'bee', 'cat'
proc3.call 'dog', 'elk'

def my_if(condition, then_clause, else_clause)
  if condition
    then_clause.call
  else
    else_clause.call
  end
end

5.times do |val|
  my_if val < 2,
    -> { puts "#{val} is small" },
    -> { puts "#{val} is big" }
end
