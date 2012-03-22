# encoding: UTF-8

require File.expand_path('../fizzbuzz', __FILE__)

describe "Fizzbuzz" do
  context "é divisível" do
    it "por 3" do
      fizzbuzz(9).should == "fizz"
    end

    it "por 5 " do
      fizzbuzz(10).should == "buzz"
    end

    it "por 3 e 5" do
      fizzbuzz(15).should == "fizzbuzz"
    end
  end

  context "se não for divisível por 3 ou 5" do
    it "retorna o mesmo valor" do
      numero = 7
      fizzbuzz(numero).should == numero
    end
  end

end
