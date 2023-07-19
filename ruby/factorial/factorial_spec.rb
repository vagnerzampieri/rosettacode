# frozen_string_literal: true

require './factorial'

RSpec.describe 'Factorial' do
  context 'when factorial is' do
    it '0 equal 1' do
      expect(factorial(0)).to eql(1)
    end

    it '2 equal 2' do
      expect(factorial(2)).to eql(2)
    end

    it '3 equal 6' do
      expect(factorial(3)).to eql(6)
    end

    it '10 equal 3628800' do
      expect(factorial(10)).to eql(3_628_800)
    end
  end
end
