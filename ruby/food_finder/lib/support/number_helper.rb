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
    unit      = options[:unit]      || '$'
    precision = options[:precision] || 2
    delimiter = options[:delimiter] || ','
    separator = options[:separator] || '.'

    separator         = '' if precision == 0
    integer, decimal  = number.to_s.split('.')

    i = integer.length
    until i <= 3
      i -= 3
      integer = integer.insert(i, delimiter)
    end

    if precision == 0
      precise_decimal = ''
    else
      # make sure decimal is not nil
      decimal ||= '0'
      # make sure the decimal is not too large
      decimal = decimal[0, precision - 1]
      # make sure the decimal is not too short
      precise_decimal = decimal.ljust(precision, '0')
    end

    unit + integer + separator + precise_decimal
  end
end
