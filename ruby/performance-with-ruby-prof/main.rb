# require 'ruby-prof'
require 'vernier'

def sleeper
  # sleep(4)
  t = Time.now.to_f
  while Time.now.to_f < t + 4.0
    # do nothing
  end
end

# result = RubyProf::Profile.profile { sleeper }
# printer = RubyProf::FlatPrinter.new(result)
# printer.print(STDOUT)

Vernier.profile(out: 'sleeper.json') { sleeper }
