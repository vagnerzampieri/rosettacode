# frozen_string_literal: true

# The Subject interface declares common operations for both RealSubject and the
# Proxy. As long as the client works with RealSubject using this interface,
# you'll be able to pass it a proxy instead of a real subject.
class Subject
  # @abstract
  def request
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
