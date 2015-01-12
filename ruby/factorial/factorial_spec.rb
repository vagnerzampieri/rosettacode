require './factorial'

RSpec.describe 'Factorial' do
  context 'when factorial is' do
    it '2 equal 2' do
      expect(factorial(2)).to eql(2)
    end

    it '3 equal 6' do
      expect(factorial(6)).to eql(6)
    end

    it '10 equal 3628800' do
      expect(factorial(10)).to eql(3628800)
    end
  end
end