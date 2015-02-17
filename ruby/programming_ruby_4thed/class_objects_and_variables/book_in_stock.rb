class BookInStock
  attr_reader   :isbn
  attr_accessor :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def price_in_cents
    Integer(price*100 + 0.5)
  end

  def price_in_cents=(cents)
    @price = cents / 100.0
  end

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end
end

p b1 = BookInStock.new('isbn1', 3)
p b2 = BookInStock.new('isbn2', 3.14)
p b3 = BookInStock.new('isbn3', '5.67')

puts b1
puts b2
puts b3

p "ISBN = #{b1.isbn}"
p "Price = #{b1.price}"

b1.price = b1.price * 0.75

p "Price = #{b1.price}"
p "Price in cents = #{b1.price_in_cents}"
b1.price_in_cents = 1234
p "Price in cents = #{b1.price_in_cents}"
