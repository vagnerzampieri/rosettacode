require "spec"
require "./fizz_buzz"

describe "FizzBuzz" do
  context "quando o valor for múltiplo de" do
    it "3 deve ser fizz" do
      fizz_buzz(3).should eq("fizz")
    end

    it "5 deve ser buzz" do
      fizz_buzz(5).should eq("buzz")
    end

    it "3 e 5, o valor deve ser fizzbuzz" do
      fizz_buzz(15).should eq("fizzbuzz")
    end
  end

  it "quando o valor não for múltiplo de 3 ou de 5, deve ser o próprio valor" do
    fizz_buzz(7).should eq("7")
  end
end
