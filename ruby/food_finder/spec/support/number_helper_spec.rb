require 'support/number_helper'

RSpec.describe NumberHelper do
  describe '#number_to_currency' do
    context 'to dollar' do
      it 'with 2 digits should be $10.00' do
        dollar = Dollar.new(10)
        expect(dollar.number).to eql('$10.00')
      end

      it 'with 6 digits should be $1,000.00' do
        dollar = Dollar.new(1000)
        expect(dollar.number).to eql('$1,000.00')
      end
    end

    context 'to real' do
      it 'with 2 digits should be R$10,00' do
        real = Real.new(10)
        expect(real.number).to eql('R$10,00')
      end

      it 'with 6 digits should be R$1.000,00' do
        real = Real.new(1000)
        expect(real.number).to eql('R$1.000,00')
      end
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
