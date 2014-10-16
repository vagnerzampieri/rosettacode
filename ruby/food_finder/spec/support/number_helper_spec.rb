require 'support/number_helper'

RSpec.describe NumberHelper do
  describe '#number_to_currency' do
    it 'to dollar' do
      dollar = Dollar.new(10)
      expect(dollar.number).to eql('$10.00')
    end

    it 'to real' do
      real = Real.new(10)
      expect(real.number).to eql('R$10,00')
    end
  end
end

# Use to test NumberHelper
class Dollar
  include NumberHelper
  attr_accessor :number

  def initialize(number)
    @number = number_to_currency(number)
  end
end

# Use to test NumberHelper
class Real
  include NumberHelper
  attr_accessor :number

  def initialize(number)
    @number = number_to_currency(number,
                                 unit: 'R$',
                                 delimiter: '.',
                                 separator: ',')
  end
end
