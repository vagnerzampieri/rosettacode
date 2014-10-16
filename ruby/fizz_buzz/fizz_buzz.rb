def fizz_buzz(value)
  if value % 3 == 0 and value % 5 == 0
    'fizzbuzz'
  elsif value % 3 == 0
    'fizz'
  elsif value % 5 == 0
    'buzz'
  else
    value
  end
end
=begin
1.upto(100) do |v|
  p fizz_buzz(v)
end
=end
