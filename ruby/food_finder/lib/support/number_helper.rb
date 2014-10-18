require 'support/formats_in_currency'
# This module illustrates how additional functionality can be
# included (or "mixed-in") to a class and then reused.
# Borrows heavily from Ruby on Rails' number_to_currency method.
# Use:
# class Dollar
#   include NumberHelper
#   attr_accessor :number
#
#   def initialize(number)
#       @number = number_to_currency(number)
#   end
# end
#
# class Real
#   include NumberHelper
#   attr_accessor :number
#
#   def initialize(number)
#     @number = number_to_currency(number,
#                                  unit: 'R$',
#                                  delimiter: '.',
#                                  separator: ',')
#   end
# end
module NumberHelper
  def number_to_currency(number, options = {})
    format = FormatsInCurrency.new(number, options)
    format.unit + format.number + format.separator + format.precise_decimal
  end
end
