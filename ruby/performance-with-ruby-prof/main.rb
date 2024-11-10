require 'ruby-prof'

def sleeper
  sleep(4)
end

result = RubyProf::Profile.profile { sleeper }
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
