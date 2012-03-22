def fizzbuzz(numero)
  if numero %3 == 0 and numero %5 == 0
    "fizzbuzz"
  elsif numero %3 == 0
    "fizz"
  elsif numero %5 == 0
    "buzz"
  else
    numero
  end

end
