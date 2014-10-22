require './fizz_buzz'

RSpec.describe 'FizzBuzz' do
  context "quando o valor for múltiplo de" do
    it "3 deve ser fizz" do
      expect(fizz_buzz(3)).to eql('fizz')
    end

    it "5 deve ser buzz" do
      expect(fizz_buzz(5)).to eql('buzz')
    end

    it "3 e 5, o valor deve ser fizzbuzz" do
      expect(fizz_buzz(15)).to eql('fizzbuzz')
    end
  end

  it "quando o valor não for múltiplo de 3 ou de 5, deve ser o próprio valor" do
    expect(fizz_buzz(7)).to eql('7')
  end
end
