require 'support/formats_in_currency'

RSpec.describe FormatsInCurrency do
  before do
    @format       = FormatsInCurrency.new(10)
    @format_real  = FormatsInCurrency.new(1000,
                                          unit: 'R$',
                                          delimiter: '.',
                                          separator: ',')
  end

  context '#unit' do
    it 'when dollar should be $' do
      expect(@format.unit).to eql('$')
    end

    it 'when real should be R$' do
      expect(@format_real.unit).to eql('R$')
    end
  end

  context '#number' do
    it 'with 2 digits should be 10' do
      expect(@format.number).to eql('10')
    end

    it 'with 4 digits should be 1,000' do
      format = FormatsInCurrency.new(1000)
      expect(format.number).to eql('1,000')
    end

    it 'with 4 digits and real should be 1.000' do
      expect(@format_real.number).to eql('1.000')
    end
  end

  context '#separator' do
    it 'when dollar should be "."' do
      expect(@format.separator).to eql('.')
    end

    it 'when real should be ","' do
      expect(@format_real.separator).to eql(',')
    end

    it 'when precision 0 should be ""' do
      format = FormatsInCurrency.new(10, precision: 0)
      expect(format.separator).to eql('')
    end
  end

  context '#precise_decimal' do
    it 'when precise 2 should be 00' do
      expect(@format.precise_decimal).to eql('00')
    end
  end
end
