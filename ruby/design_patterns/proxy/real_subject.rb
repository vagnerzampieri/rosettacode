# frozen_string_literal: true

require_relative 'subject'

# The RealSubject contains some core business logic. Usually, RealSubjects are
# capable of doing some useful work which may also be very slow or sensitive -
# e.g. correcting input data. A Proxy can solve these issues without any changes
# to the RealSubject's code.
class RealSubject < Subject
  def request
    puts 'RealSubject: Handling request.'
  end
end
