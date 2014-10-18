# Use:
# format = FormatsInCurrency.new(number, options)
# format.unit + format.number + format.separator + format.precise_decimal
class FormatsInCurrency
  def initialize(number, options = {})
    @number   = number
    @options  = options
  end

  def unit
    @options[:unit] || '$'
  end

  def number
    integer = split_number[0]
    i = integer.length
    until i <= 3
      i -= 3
      integer = integer.insert(i, delimiter)
    end
    integer
  end

  def separator
    return '' if precision == 0
    @options[:separator] || '.'
  end

  def precise_decimal
    if precision == 0
      ''
    else
      decimal = split_number[1]
      # make sure decimal is not nil
      decimal ||= '0'
      # make sure the decimal is not too large
      decimal = decimal[0, precision - 1]
      # make sure the decimal is not too short
      decimal.ljust(precision, '0')
    end
  end

  private

  def split_number
    @number.to_s.split('.')
  end

  def delimiter
    @options[:delimiter] || ','
  end

  def precision
    @options[:precision] || 2
  end
end
